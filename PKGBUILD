# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=galactrum-qt
pkgver=1.1.6
pkgrel=1
arch=('i686' 'x86_64')
url="https://www.galactrum.org/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(galactrum)
install=galactrum-qt.install
source=("${pkgname%-git}::git+http://github.com/galactrum/galactrum.git"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '3f76c3fed096afc884bdeefdce0882103c968de3ad235c720e3012aa9ab0d4e4')

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --with-gui=qt5
  make
}


package() {
  install -Dm644 galactrum-qt.desktop "$pkgdir"/usr/share/applications/galactrum.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/galactrum-qt "$pkgdir"/usr/bin/galactrum-qt
  install -Dm644 share/pixmaps/galactrum128.png "$pkgdir"/usr/share/pixmaps/galactrum128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
