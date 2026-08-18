# Maintainer: Liviu Nicoara <lnicoara at thinkoid dot org>

pkgname=wifish-git
pkgver=r6.41b8920
pkgrel=1
pkgdesc="ncurses Wi-Fi picker for raw wpa_supplicant, with insult swordfighting"
arch=('x86_64')
url="https://github.com/thinkoid/wifish"
license=('WTFPL')
depends=('ncurses' 'wpa_supplicant')
makedepends=('git' 'meson')
provides=('wifish')
conflicts=('wifish')
source=("wifish::git+https://github.com/thinkoid/wifish.git")
sha256sums=('SKIP')

pkgver() {
    cd wifish
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    arch-meson wifish build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm644 wifish/LICENSE \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
