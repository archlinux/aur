# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Maintainer: Georg S. Voelker <voelker@maibox.org>
# Based on python-mshr-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com>

_base=mshr
pkgname=${_base}
pkgdesc="Mesh generation component of FEniCS (stable)."
pkgver=2019.1.0
pkgrel=2
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/${_base}"
license=('GPL3')
groups=('fenics')
conflicts=('python-mshr-git')
depends=('dolfin=2019.1.0.post0' 'mpfr')
makedepends=('git' 'cmake')
options=(!emptydirs)
source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/fenics-project/${_base}/downloads/${_base}-${pkgver}.tar.gz)
sha256sums=('0be8f261e7370404863067badadd230dbd55d54f6ffeba15728f4a9bfc856173')

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
