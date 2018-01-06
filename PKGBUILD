# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Gleidson Echeli <gleidson dot echeli at gmail dot com>

pkgname=umlet
pkgver=14.2
_pkgver=14_2
pkgrel=1
pkgdesc="Free UML Tool for Fast UML Diagrams (stand-alone version)"
arch=('any')
url="http://www.umlet.com"
license=('GPL')
depends=('java-runtime')
makedepends=('unzip' 'patch')
source=("http://www.umlet.com/umlet_${_pkgver}/umlet-standalone-${pkgver}.zip"
	'umlet.desktop'
	'UMLet.sh.diff')
md5sums=('25d249dc14dc93cfe8aebee5b138fcde'
         '4efcfeea2f54b849bc86e3f1905449be'
         'ef9620bd90f0e3bba7133629cf5885c8')

prepare() {
  cd "$srcdir"/Umlet
  patch -Np1 -i ../UMLet.sh.diff
  rm -f umlet.sh.orig
  rm -f Umlet.exe
}

package() {
  cd "$srcdir"/Umlet
  mkdir -p "$pkgdir"/usr/bin
  ln -s /usr/share/umlet/umlet.sh "$pkgdir"/usr/bin/umlet
  install -d -m755 "$pkgdir"/usr/share
  mv "$srcdir"/Umlet "$pkgdir"/usr/share/umlet
  install -D -m644 "$srcdir"/umlet.desktop "$pkgdir"/usr/share/applications/umlet.desktop
  chmod a+x "$pkgdir"/usr/share/umlet/umlet.sh
}
