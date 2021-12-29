# Maintainer: Tianhao Chai <cth451@gmail.com>

pkgname=nbtp
pkgver=0.3.2
pkgrel=1
pkgdesc="NBT parsing library"
arch=(x86_64)
url="https://git.cth451.me/cth451/nbtp"
license=(LGPLv3)
depends=(fmt pybind11 python3)
source=(
"${pkgname}-v${pkgver}.tar.gz::https://git.cth451.me/cth451/nbtp/-/archive/v${pkgver}/nbtp-v${pkgver}.tar.gz"
)
sha512sums=('7d5b48c799f59e6066086c5ffda59246758f78c554b87791ca8d13710a224cdc0cfdf360feb83dd2d11e90666b054849e033fded1a4e7f424666ae5feaf46d6d')

prepare() {
	tar -xvf ${pkgname}-v${pkgver}.tar.gz
}

build() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make -j
}

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}
