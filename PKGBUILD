# Maintainer: Tony Lambiris <tony@criticalstack.com

pkgname=double-conversion-git
pkgver=3.1.0.r5.g4b2a7f3
pkgrel=1
pkgdesc='Efficient binary-decimal and decimal-binary conversion routines for IEEE doubles.'
arch=(i686 x86_64)
url='https://github.com/google/double-conversion'
license=(BSD)
conflicts=(double-conversion)
provides=(double-conversion)
depends=(gcc-libs)
makedepends=(git scons cmake)
source=("${pkgname}::git+https://github.com/google/double-conversion.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p build
}

build() {
	cd build

	cmake ../${pkgname} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON
	make
}

package () {
	cd build

	make DESTDIR="${pkgdir}" install

	install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
