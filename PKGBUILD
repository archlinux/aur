# Maintainer: Tianhao Chai <cth451@gmail.com>

pkgname=nbtp
pkgver=0.3.3
pkgrel=1
pkgdesc="NBT parsing library"
arch=(x86_64)
url="https://git.cth451.me/cth451/nbtp"
license=(LGPLv3)
depends=(fmt pybind11 python3)
source=(
"${pkgname}-v${pkgver}.tar.gz::https://git.cth451.me/cth451/nbtp/-/archive/v${pkgver}/nbtp-v${pkgver}.tar.gz"
)
sha512sums=('435466a101622ef978385e65ce57ca6b954e5f48784adb2f2364b77f2e5154d44578079a46d2fa2da6d1e5f0a373b30bda8a6d570ea14539a8628c4cad75b59e')

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
