# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=alps-qt
pkgver=12.3.70214
pkgrel=1
arch=('i686' 'x86_64')
url="https://alpenschilling.cash/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(alps)
install=alps-qt.install
source=("${pkgname%-git}::git+http://github.com/Alpenschilling/Alpenschilling.git"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '138b2678a7117d1ff90fa76c7cbf3a5ca3a96d7a3eaa2930ac9b885593c82199')

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --with-gui=qt5
  make
}


package() {
  install -Dm644 alps-qt.desktop "$pkgdir"/usr/share/applications/alps.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/alps-qt "$pkgdir"/usr/bin/alps-qt
  install -Dm644 share/pixmaps/alps256.png "$pkgdir"/usr/share/pixmaps/alps256.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
