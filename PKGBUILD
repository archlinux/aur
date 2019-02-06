# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com >
pkgname=dune-pdelab
pkgver=2.6.0
pkgrel=1
pkgdesc='Assembly for partial differential equations in DUNE'
groups=('dune')
arch=('i686' 'x86_64')
url='https://gitlab.dune-project.org/extensions/dune-pdelab'
license=('custom')
makedepends=('cmake' 'gcc-fortran' "dune-common>=2.6.0" "dune-typetree" "dune-geometry" "dune-grid" "dune-istl" "dune-localfunctions" 'dune-alugrid>=2.6.0' 'dune-functions>=2.6.0' 'openmpi' 'eigen' 'superlu' 
	    'suitesparse' 'alberta' 'gmp' 'git')
source=("git+https://gitlab.dune-project.org/pdelab/${pkgname}.git#branch=releases/2.6")
md5sums=('SKIP')

build() {
	CMAKE_FLAGS='-DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -fPIC -DBUILD_SHARED_LIBS:BOOL=OFF' \
	        dunecontrol configure --enabled-shared
	dunecontrol  make
}

package() {
	dunecontrol --only=${pkgname} make install DESTDIR="${pkgdir}"
	install -m644 -D ${pkgname}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	find "${pkgdir}" -type d -empty -delete
}
