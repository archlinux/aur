# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com > 

pkgname=python-bempp-git
_pkgname=bempp
pkgdesc='The BEM++ boundary element library'
pkgver=v3.1.2.r29.g4257c235
pkgrel=2
epoch=1
arch=('i686' 'x86_64')
provides=('python-bempp')
url="https://bempp.com/"
license=(MIT)
options=('!strip')
depends=('python-scipy' 'gmsh' 'python-mpi4py')
makedepends=('dune-common' 'dune-geometry' 'ug' 'doxygen' 'intel-tbb')
optdepends=('ipython: interactive console'
	    'gmsh: external plots'
)
source=('git+https://bitbucket.org/bemppsolutions/bempp.git#branch=development')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir"/"$_pkgname"
	python setup.py build
}

package() {
	cd "$srcdir"/"$_pkgname"
	python setup.py install --skip-build -O1 --root="$pkgdir"

	cd "$pkgdir"
	install -m0644 -D "$srcdir"/$_pkgname/LICENSE usr/share/licenses/$pkgname/LICENSE
	chmod -R a+r usr
}

