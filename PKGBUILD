# Maintainer: Christian Pfeiffer <cpfeiffer at live dot de>
pkgname=muparserx
pkgver=4.0.8
pkgrel=1
pkgdesc="A fast math parser library with support for arrays, matrices and complex numbers"
arch=('x86_64')
url="https://github.com/beltoforion/muparserx"
license=('BSD')
makedepends=('cmake')
depends=('gcc-libs')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('24ef5e3afedda4a5535fe3fc03ec880493b8d5ecf399de604938401519b20b2dfcbd721d0282bc6bb7c99f9a1dab8b14caf424f28d18db8bd073d97c354ec220')

prepare() {
	mkdir build
}

build() {
	cd build
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_EXAMPLES=OFF \
		-DCMAKE_SKIP_RPATH=ON \
		"${srcdir}/${pkgname}-${pkgver}"

	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install

	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	install -m644 ${srcdir}/${pkgname}-${pkgver}/License.txt ${pkgdir}/usr/share/licenses/${pkgname}
}