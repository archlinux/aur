# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=bitcore-qt
pkgver=0.15.0
pkgrel=3
arch=('i686' 'x86_64')
url="https://bitcore.cc/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(bitcore)
install=bitcore-qt.install
source=("${pkgname%-git}::git+http://github.com/LIMXTEC/BitCore.git"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '1a3504e2daf78f7dd86fcca457f08dc97272d5a4d68ce5cc20c64c8d0807c07f')

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --with-gui=qt5
  make
}


package() {
  install -Dm644 bitcore-qt.desktop "$pkgdir"/usr/share/applications/bitcore.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/bitcore-qt "$pkgdir"/usr/bin/bitcore-qt
  install -Dm644 share/pixmaps/bitcore128.png "$pkgdir"/usr/share/pixmaps/bitcore128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
