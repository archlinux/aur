# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Gleidson Echeli <gleidson dot echeli at gmail dot com>

pkgname=umlet
pkgver=14.3.0
_pkgver=14_3
pkgrel=1
pkgdesc="Free UML Tool for Fast UML Diagrams (stand-alone version)"
arch=('any')
url="https://www.umlet.com"
license=('GPL')
depends=('java-runtime')
makedepends=('unzip' 'patch')
source=("http://www.umlet.com/umlet_${_pkgver}/umlet-standalone-${pkgver}.zip"
	'umlet.desktop'
	'UMLet.sh.diff')
md5sums=('1202a9f93780b2187bfcdf96f8984955'
         '4efcfeea2f54b849bc86e3f1905449be'
         '8117f3f2bf7764d94c38ac8ca02ed279')

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
