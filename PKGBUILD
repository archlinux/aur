# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgname=snoreport
pkgver=1.3
pkgrel=1
pkgdesc=""
arch=('x86_64' 'i686')
license=('Custom')
url="http://www.bioinf.uni-leipzig.de/Software/snoReport/"
depends=('viennarna')
optdepends=()
makedepends=()
provides=()
source=(http://www.bioinf.uni-leipzig.de/Software/snoReport/SnoReport-${pkgver}.tar.gz
        buildfix.patch)
md5sums=( 'SKIP'
          'SKIP')

prepare() {
  cd "${srcdir}/SnoReport-${pkgver}"
  patch -p1 < ../buildfix.patch
  mv configure.in configure.ac
  autoreconf -i
}

build() {
  cd "${srcdir}/SnoReport-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/SnoReport-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
  mv "${pkgdir}/usr/bin/summarizeOutput.pl" "${pkgdir}/usr/share/snoReport/"
}

