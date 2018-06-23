# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Based on python-mshr-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com>

_base=mshr
pkgname=${_base}
pkgdesc="Mesh generation component of FEniCS (stable)."
pkgver=2018.1.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/${_base}"
license=('GPL3')
groups=('fenics')
conflicts=('python-mshr-git')
depends=('dolfin=2018.1.0' 'mpfr')
makedepends=('git')
options=(!emptydirs)
source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/fenics-project/${_base}/downloads/${_base}-${pkgver}.tar.gz)
sha256sums=('c2f91300aff792de76b937e7e709076d8ac37043ddb6fe250ebb4229b48ac014')

build() {
	cd ${srcdir}/${_base}-${pkgver}
	[ -d build ] && rm -rf build
	mkdir build
	cd build

	cmake .. \
		-DCMAKE_INSTALL_PREFIX="${pkg}"/usr \
		-DCMAKE_SKIP_BUILD_RPATH=TRUE \
		-DCMAKE_SKIP_RPATH=TRUE \
		-DCMAKE_BUILD_TYPE="Release"

	make
}

package() {
	cd ${srcdir}/${_base}-${pkgver}/build
	make install DESTDIR="${pkgdir}"
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
