# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Frank Siegert <frank dot siegert at googlemail dot com>
pkgname=hepmc2
_pkgname=hepmc
pkgver=2.06.11
pkgrel=3
pkgdesc="A particle physics package for storing collision events from Monte Carlo generators"
arch=('x86_64')
url="http://hepmc.web.cern.ch/"
license=('GPL2')
depends=('bash')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::http://hepmc.web.cern.ch/${_pkgname}/releases/${_pkgname}${pkgver}.tgz")
b2sums=('ac8eef250cb330a167c9e0f4bd1aaf8df82e0ffec3557ab5cdaf8bc5b0b7333d6a45f73710ce63abab52d2c5758d5663c15c2a7c940a09504b3ef2fd4517aa0b')

build() {
    mkdir build
    cd build
    cmake "${srcdir}/HepMC-${pkgver}" -DCMAKE_INSTALL_PREFIX:PATH=/usr -Dmomentum=GEV -Dlength=MM
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}
