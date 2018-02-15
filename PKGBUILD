# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

_base=mshr
_fragment="#branch=master"
pkgname=${_base}-git
pkgdesc="Mesh generation component of FEniCS"
pkgver=20180104
pkgrel=1
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/${_base}"
license=('GPL3')
groups=('fenics-git')
depends=('python-dolfin-git' 'mpfr')
makedepends=('git')
options=(!emptydirs)
source=("${_base}::git+https://bitbucket.org/fenics-project/${_base}.git${_fragment}")
md5sums=('SKIP')

pkgver() {
	cd ${_base}
	git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
	cd ${_base}
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
	cd ${_base}/build
	make install DESTDIR="${pkgdir}"
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
