# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=mktcoin-qt
pkgver=0.14.3
pkgrel=1
arch=('i686' 'x86_64')
url="http://mktcoin.org/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(mktcoin)
install=mktcoin-qt.install
source=("${pkgname%-git}::git+https://github.com/Mktcoin-official/Mktcoin.git"
        "$pkgname.desktop")
sha256sums=('SKIP'
            'bef7078e3c7428b8b6c56d832b0742a00801ba5d7b7f39c430142444c5143654')

build() {
  cd "$srcdir/$pkgname"
  find . -type f -iname "*.sh" -exec chmod +x {} \; 
  ./autogen.sh
  ./configure --with-gui=qt5 --disable-tests
  make
}


package() {
  install -Dm644 mktcoin-qt.desktop "$pkgdir"/usr/share/applications/mktcoin.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/mktcoin-qt "$pkgdir"/usr/bin/mktcoin-qt
  install -Dm644 share/pixmaps/mktcoin.png "$pkgdir"/usr/share/pixmaps/mktcoin128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
