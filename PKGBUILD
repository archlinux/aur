# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=hilux-qt
pkgver=1.0.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.hiluxcoin.com/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(hilux)
install=hilux-qt.install
source=("${pkgname%-git}::git+https://github.com/swatchie-1/hilux.git#tag=v${pkgver}"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '2b16e0d549b5b537f7f1c5a46bca199c22e018179377e65ea89a1ff33a962770')

build() {
  cd "$srcdir/$pkgname"
  find . -type f -iname "*.sh" -exec chmod +x {} \; 
  ./autogen.sh
  chmod +x ./configure
  ./configure --with-gui=qt5 --disable-tests
  make
}


package() {
  install -Dm644 hilux-qt.desktop "$pkgdir"/usr/share/applications/hilux.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/hilux-qt "$pkgdir"/usr/bin/hilux-qt
  install -Dm644 share/pixmaps/hilux128.png "$pkgdir"/usr/share/pixmaps/hilux128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
