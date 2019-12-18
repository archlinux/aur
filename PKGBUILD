# Maintainer: Christian Pfeiffer <cpfeiffer at live dot de>
pkgname=openfast-git
pkgver=v2.1.0.r184.ge4faf27b
pkgrel=1
pkgdesc="A wind turbine simulation tool by NREL"
arch=('x86_64')
url="https://github.com/OpenFAST/openfast"
license=('Apache')
makedepends=('cmake' 'git')
depends=('lapack' 'hdf5' 'yaml-cpp')
source=("${pkgname}::git+https://github.com/OpenFAST/openfast.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir build
}

build() {
	cd build

	cmake -DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_SKIP_RPATH=ON \
    -DBUILD_DOCUMENTATION=ON \
    -DBUILD_OPENFAST_CPP_API=ON \
		"${srcdir}/${pkgname}"

	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
