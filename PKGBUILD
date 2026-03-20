# Maintainer: WaffleThief123 <https://github.com/WaffleThief123>
pkgname=hyperx-alpha-wireless-git
pkgver=r1
pkgrel=1
pkgdesc="Linux manager for the HyperX Cloud Alpha Wireless headset"
arch=('x86_64')
url="https://github.com/WaffleThief123/HyerpxAlpha-Linux"
license=('MIT')
depends=('wxwidgets-gtk3' 'hidapi' 'systemd-libs')
makedepends=('cmake' 'pkgconf' 'git')
provides=('hyperx-alpha-wireless')
conflicts=('hyperx-alpha-wireless')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd "$pkgname"
    install -Dm755 bin/Hyperx "$pkgdir/usr/bin/Hyperx"
    install -Dm644 -t "$pkgdir/usr/share/hyperx/img/" bin/img/*.png
    install -Dm644 99-hyperx.rules "$pkgdir/etc/udev/rules.d/99-hyperx.rules"
    install -Dm644 hyperx-alpha.desktop "$pkgdir/usr/share/applications/hyperx-alpha.desktop"
}
