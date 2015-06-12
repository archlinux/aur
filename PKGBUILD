# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=libsbgn-svn
pkgver=r276
pkgrel=1
pkgdesc="Systems Biology Graphical Notation library"
arch=('i686' 'x86_64')
url="http://www.libsbgn.org"
license=('LGPL' 'Apache')
depends=('xsd' 'java-environment' 'xerces-c')
makedepends=('apache-ant')
conflicts=('libsbgn')
provides=('libsbgn')
source=($pkgname::"svn+https://libsbgn.svn.sourceforge.net/svnroot/libsbgn/trunk")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$pkgname"
  ant
  
#  cd cpp_binding
#  sed -i '/XSDFLAGS :=/s|$| --generate-serialization|' makefile
#  make XSD_BASE=/usr XSD=/usr/bin/xsdcxx
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 resources/SBGN.xsd "$pkgdir/usr/share/libsbgn/SBGN.xsd"
  install -Dm755 dist/org.sbgn.jar "$pkgdir/usr/share/java/org.sbgn.jar"

#  cd cpp_binding
#  make PREFIX="$pkgdir/usr" install
}
