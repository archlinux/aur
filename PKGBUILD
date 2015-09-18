# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgname=gotohscan
pkgver=2.0_alpha
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="Search short sequences in large database sequences by computing all semi-global alignments"
arch=('i686' 'x86_64')
license=('Custom')
url="http://www.bioinf.uni-leipzig.de/Software/GotohScan"
depends=('perl')
makedepends=()
provides=('GotohScan2a=2.0' 'fastaALN2frequency.pl' 'reformatMotif.pl')
source=(http://www.bioinf.uni-leipzig.de/Software/GotohScan/GotohScan_${_pkgver}.tar.gz
        http://www.bioinf.uni-leipzig.de/Software/GotohScan/README
        'package.patch')
md5sums=( '6ecf4071c8ef1775e5102adb7c7603ca'
          '0d7ed086e2aec7cbb1879f99211229f4'
          '877991c3faeee70f5b0ce3746888bffd')

build() {
  cd "${srcdir}/GotohScan_${_pkgver}"
  patch -p1 < ${srcdir}/package.patch
  cp ${srcdir}/README doc/README_1.3
  autoreconf -i
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/GotohScan_${_pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}
