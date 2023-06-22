# Maintainer: Michael Gruz <michael.gruz@gmail.com>

pkgname=libsavitar-5
pkgver=5.2.2
pkgrel=0
pkgdesc="C++ implementation of 3mf loading with SIP python bindings"
arch=('x86_64')
url="https://github.com/Ultimaker/libsavitar"
license=('AGPL')
conflicts=('libsavitar')
provides=('libsavitar')
depends=('python' 'pugixml')
makedepends=('cmake' 'dos2unix' 'git' 'pugixml' 'python-sip4' 'sip4')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz"
	"cmake.patch")
sha512sums=('4138a5c99f1a23ef0ba665211efb8feb007863291ccc8fdd21b947411da7d8cc1c3b1771adeaca57564d258aa1132093d65eb7ffb81659fc8dda40da19720a32'
            '65cc034397399c413004b9a426a8bfcd3d24c2b7b49b918f9b1bc7e9a6d6001d59d75842477f89e2004e163b52b20c023ddca3c9ab3ed60cfcc23c1716f6f91a')

prepare() {
	cd "libSavitar-${pkgver}"
	patch -Np0 < ${srcdir}/cmake.patch
	dos2unix README.md
}

build() {
	cd "libSavitar-${pkgver}"
	mkdir  build && cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=yes \
		-DCMAKE_BUILD_TYPE=Release ..
	make
}

package() {
	cd "libSavitar-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
}
