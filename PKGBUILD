# Maintainer: Tony Lambiris <tony@criticalstack.com

pkgname=double-conversion-git
pkgver=2.0.1.r68.gd8d4e66
pkgrel=1
pkgdesc='Efficient binary-decimal and decimal-binary conversion routines for IEEE doubles.'
arch=(i686 x86_64)
url='https://github.com/google/double-conversion'
license=(BSD)
conflicts=(double-conversion)
provides=(double-conversion)
replaces=(double-conversion)
depends=()
makedepends=(git scons cmake)
source=(git+https://github.com/google/double-conversion.git)
md5sums=(SKIP)

pkgver() {
	cd "${srcdir}"/double-conversion
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}"/double-conversion
	cmake -Wno-dev \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_INSTALL_PREFIX=/usr .
	make
}

check() {
	cd "${srcdir}"/double-conversion
	make test
}

package() {
	cd "${srcdir}"/double-conversion
	make DESTDIR="$pkgdir" install
}
