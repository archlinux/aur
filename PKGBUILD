# Maintainer: Lukas Böger <dev___AT___lboeger___DOT___de>

pkgname=dune-alugrid
pkgver=2.4.0
pkgrel=2

pkgdesc='Unstructured simplicial and cube DUNE grids'
groups=('dune')
arch=('i686' 'x86_64')

url='https://gitlab.dune-project.org/extensions/dune-alugrid'
license=('GPL2')

makedepends=('git' 'cmake' 'dune-common=2.4.1' 'dune-grid=2.4.1' 'dune-geometry=2.4.1' 'openmpi'
    'zlib' 'metis' 'parmetis')

source=("${pkgname}-${pkgver}::git+https://gitlab.dune-project.org/extensions/${pkgname}.git#tag=v2.4.0")

md5sums=('SKIP')

build() {
    CMAKE_FLAGS='-DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib' \
        dunecontrol --use-cmake configure

    dunecontrol --use-cmake make
}

package() {
    dunecontrol --use-cmake make install DESTDIR="${pkgdir}"

    find "${pkgdir}" -type d -empty -delete
}
