# Submitter: Gavin Lloyd <gavinhungry@gmail.com>
# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=gqrx-scanner
pkgver=1.0.5
pkgrel=1
pkgdesc="A frequency scanner for Gqrx Software Defined Radio receiver"
arch=('x86_64')
url="https://github.com/neural75/gqrx-scanner"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('76eb312cbae4407524df137d2ca7377b5c400ba350d9566dfc5a82328a6aca52')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
