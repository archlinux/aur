# Maintainer: Alexander Björk <aur.operator320@passmail.net>
pkgname=viiper
pkgver=0.6.0
pkgrel=3
pkgdesc="Virtual Input over IP Emulator - VIIPER is a tool to create virtual input devices using USBIP"
arch=('x86_64')
url="https://github.com/Alia5/VIIPER"
license=('GPL-3.0-or-later')
depends=('glibc' 'usbip')
makedepends=('go' 'git')
provides=('viiper')
conflicts=('viiper-bin' 'viiper-git')
install=viiper.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "viiper.service"
        "viiper.install")
sha256sums=('44112fee78636426c1c32ca2aad76c38e89cef213d400c05999dcec09f743ad3'
            '4944a90179737bde276ba88e3d6ebc2d6e47afb255f14afd454bbf5d5d06f18d'
            '77b1ca9502d662c52607d5af4ed3ec16b38457e63ba7216dd8fc1d01fef52608')

prepare() {
    cd "VIIPER-$pkgver"
    mkdir -p build
}

build() {
    cd "VIIPER-$pkgver"
    make
}

package() {
    cd "VIIPER-$pkgver"
    install -Dm755 "dist/viiper" "$pkgdir/usr/bin/viiper"
    install -Dm644 "../viiper.service" "$pkgdir/usr/lib/systemd/system/viiper.service"
}
