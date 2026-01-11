# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgname=gotohscan
pkgver=2.0_alpha
_pkgver=${pkgver//_/-}
pkgrel=2
pkgdesc="Search short sequences in large database sequences by computing all semi-global alignments"
arch=('i686' 'x86_64')
license=('Custom')
url="http://www.bioinf.uni-leipzig.de/Software/GotohScan"
depends=('perl')
makedepends=()
provides=('GotohScan2a=2.0' 'fastaALN2frequency.pl' 'reformatMotif.pl')
source=(http://www.bioinf.uni-leipzig.de/Software/GotohScan/GotohScan_${_pkgver}.tar.gz
        'package.patch'
        'README')
sha256sums=('4ac522208067fb758181262b9f0e8d2a896b7a0af964defad3b03813cc836247'
            'a104ef6625edcda41ea908367f84760e3c96d8e7c005c7f8167f998c20a18e9d'
            'de73b743fdee60fcf98969fa0041ed06717f1f8f4bc3e0bdc0e75cd500ca94ce')

build() {
  cd "${srcdir}/GotohScan_${_pkgver}"
  patch -p1 < ${srcdir}/package.patch
  cp ${srcdir}/README doc/README_1.3
  autoreconf -i
  ./configure --prefix=/usr CFLAGS="-fpermissive" || return 1
  make || return 1
}

package() {
  cd "${srcdir}/GotohScan_${_pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}
