# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com >
pkgname=dune-alugrid
pkgver=2.6.0
pkgrel=1
pkgdesc='Unstructured simplicial and cube DUNE grids'
groups=('dune')
arch=('i686' 'x86_64')
url='https://gitlab.dune-project.org/extensions/dune-alugrid'
license=('GPL2')
makedepends=('git' 'cmake' 'dune-common' 'dune-grid' 'dune-geometry' 'openmpi'
    'zlib' 'metis' 'parmetis')

source=("git+https://gitlab.dune-project.org/extensions/${pkgname}.git#branch=releases/2.6")
md5sums=('SKIP')

package() {
dunecontrol --only=${pkgname} make install DESTDIR="${pkgdir}"
install -m644 -D ${pkgname}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
find "${pkgdir}" -type d -empty -delete
}

build() {
CMAKE_FLAGS='-DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -fPIC -DBUILD_SHARED_LIBS:BOOL=OFF' \
	        dunecontrol configure --enabled-shared
    dunecontrol  make
}

