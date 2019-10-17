# Maintainer: Riko Sakurauchi <lijiahao99131@gmail.com>
pkgname=librcnb
pkgver=1.0.0
pkgrel=1
pkgdesc='Everything can be encoded to rcnb.'
arch=('x86_64')
url='https://github.com/rcnbapp/librcnb'
license=('MIT')
depends=('glibc')
makedepends=('cmake>=3.1')
source=("https://github.com/rcnbapp/librcnb/archive/v${pkgver}.tar.gz")
sha256sums=('a8c2fb89c5249d810633ecda573ca044428699652c810f2ed2c1f595c8e0d4d0')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      ..
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make install DESTDIR="${pkgdir}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/librcnb/LICENSE"
}
