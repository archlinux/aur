# Maintainer: Lukas Böger <dev___AT___lboeger___DOT___de>

pkgname=dune-typetree
pkgver=2.4.1
pkgrel=1

pkgdesc='A template library for statically typed object trees'
groups=('dune')
url='http://www.dune-project.org/pdelab'

arch=('any')
license=('custom')

makedepends=('cmake' "dune-common=${pkgver}")

source=("http://dune-project.org/download/pdelab/${pkgver}/${pkgname}-${pkgver}.tar.gz")

md5sums=('13e5bccb0aec611c87987fd09c36f76e')

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
