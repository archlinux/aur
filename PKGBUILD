# Submitter: Gavin Lloyd <gavinhungry@gmail.com>
# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=gqrx-scanner
pkgver=1.0.3
pkgrel=2
pkgdesc="A frequency scanner for Gqrx Software Defined Radio receiver"
arch=('x86_64')
url="https://github.com/neural75/gqrx-scanner"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5fd402d0fcaefcc9967749e375c2d25d2b26193a8432b09b56195a9eb2890a1a')

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
