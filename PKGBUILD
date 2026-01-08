# Maintainer: alba4k <blaskoazzolaaaron[at]gmail.com>
pkgname=rofi-xdph-git
pkgver=0.0.1.r2.g1755c214
pkgrel=1
pkgdesc="Use Rofi to pick what to share with XDPH"
arch=(x86_64 aarch64)
url="https://github.com/alba4k/rofi-xdph"
license=('MIT')
depends=(hyprutils qt6-base)
makedepends=(git make gcc meson ninja pkgconf)
conflicts=(rofi-xdph rofi-xdph-bin)
provides=(rofi-xdph)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd rofi-xdph
    git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd rofi-xdph
    meson setup build
    meson compile -C build
}

package() {
    cd rofi-xdph
    install -Dm755 build/rofi-xdph $pkgdir/usr/bin/rofi-xdph

	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
}

