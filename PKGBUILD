# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=straks-qt
pkgver=1.14.7
pkgrel=3
arch=('i686' 'x86_64')
url="https://www.straks.tech/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(straks)
install=straks-qt.install
source=("${pkgname%-git}::git+https://github.com/straks/straks.git#tag=${pkgver}.${pkgrel}"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '779e1b3cd7d97a06f98137be94de99a0abd0717ebd4fab054f6a33057de944d8')

build() {
  cd "$srcdir/$pkgname"
  find . -type f -iname "*.sh" -exec chmod +x {} \; 
  ./autogen.sh
  ./configure --with-gui=qt5 --disable-tests
  make
}


package() {
  install -Dm644 straks-qt.desktop "$pkgdir"/usr/share/applications/straks.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/straks-qt "$pkgdir"/usr/bin/straks-qt
  install -Dm644 share/pixmaps/straks128.png "$pkgdir"/usr/share/pixmaps/straks128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
