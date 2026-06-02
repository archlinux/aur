# Maintainer: Ender Bonnet <enbonnet@gmail.com>

pkgname=mx3
pkgver=1.0.1
pkgrel=2
pkgdesc="Gesture remapping driver for Logitech MX Master 3 mice on Linux"
arch=('x86_64')
url="https://github.com/enBonnet/mx3-linux-driver"
license=('MIT')
depends=('glibc')
makedepends=('gcc')
optdepends=('systemd: for automatic startup at boot')
conflicts=('mx3-git')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/enBonnet/mx3-linux-driver/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('92026d3f5cc4797463cfecaaed490cecc421ac7d7fa6e861aaed4a8174e42b72')

backup=('etc/mx3/config.conf')

check() {
    cd "${srcdir}/mx3-linux-driver-${pkgver}"

    make test
    make validate-packaging
}

package() {
    cd "${srcdir}/mx3-linux-driver-${pkgver}"

    make PREFIX=/usr DESTDIR="${pkgdir}" install
}
