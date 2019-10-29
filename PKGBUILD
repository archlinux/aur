# Maintainer: bork <bork at stepanian dot ca>
# Contributor: bork <bork at stepanian dot ca>

pkgname=xnecview
_pkgname="xnecview"
pkgver=1.36
pkgrel=2
pkgdesc="A program for visualizing NEC2 input and output data"
arch=('i686' 'x86_64')
url="https://www.pa3fwm.nl/software/xnecview/"
license=('GPL2')
depends=('gtk2')
provides=('xnecview')
conflicts=('xnecview')
source=(https://www.pa3fwm.nl/software/xnecview/xnecview-$pkgver.tgz)
md5sums=('c7a96fbaf006e209abe9e23bd011caa5')

prepare() {

  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed -i '/^PNG\t=\syes/d' Makefile #Disable PNG


}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/man/man1/
  gzip -c xnecview.1x > $pkgdir/usr/share/man/man1/xnecview.1.gz
  cp $pkgname $pkgdir/usr/bin
}
