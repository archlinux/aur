# Maintainer: Pablo Orduna <pabloorduna98 [at] gmail [dot] com>
# Ex-Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>
pkgname=qfsm
pkgver=0.54.0
_pkgver=0.54
pkgrel=3
pkgdesc="A graphical tool for designing finite state machines"
arch=('x86_64' 'i686')
url="http://qfsm.sourceforge.net/index.html"
license=('GPL3')
depends=('qt4' 'graphviz')
makedepends=('cmake')
install=qfsm.install
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/${pkgname}-${_pkgver}/${pkgname}-${pkgver}-Source.tar.bz2")
sha256sums=('2b53b7e54e42d4c188f62220aaae3d3fb5e8239b8ac8e88f793689cc0a5b8766')

build() {
  cd "$srcdir/${pkgname}-${pkgver}-Source"
  sed -i 's/qfsm.png/qfsm/g' desktop/qfsm.desktop
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_INSTALL_SYSCONFDIR="/etc" -DCMAKE_CXX_STANDARD=98
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}-Source"
  make DESTDIR="$pkgdir/" install
}
