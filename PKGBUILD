# Maintainer: Lukas Böger <dev___AT___lboeger___DOT___de>

pkgname=dune-pdelab
pkgver=2.4.1
pkgrel=1

pkgdesc='Assembly for partial differential equations in DUNE'
groups=('dune')
url='http://www.dune-project.org/pdelab'

arch=('i686' 'x86_64')
license=('custom')

makedepends=('cmake' "dune-common=${pkgver}"
    "dune-typetree=${pkgver}" "dune-geometry=${pkgver}" "dune-grid=${pkgver}"
    "dune-istl=${pkgver}" "dune-localfunctions=${pkgver}")
optdepends=(
    'dune-alugrid>=2.4.0: unstructured simplicial and cube grids'
    'petsc: toolkit for scientific computation'
    'eigen: linear algebra package'
    )

source=("http://dune-project.org/download/pdelab/${pkgver}/${pkgname}-${pkgver}.tar.gz")

md5sums=('c43dcdbcc92bb4440c2657ce12ad3f2b')

build() {
    CMAKE_FLAGS='-DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib' \
        dunecontrol --use-cmake configure

    dunecontrol --use-cmake make
}

package() {
    cd ./${pkgname}-${pkgver}

    dunecontrol --use-cmake make install DESTDIR="${pkgdir}"

    install -m644 -D COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
