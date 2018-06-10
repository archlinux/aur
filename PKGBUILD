# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=infinex-qt
pkgver=1.0.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://www.infinex.info/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(infinex)
install=infinex-qt.install
source=("${pkgname%-git}::git+https://github.com/InfinexOfficial/Infinex.git"
        "$pkgname.desktop")
sha256sums=('SKIP'
            'ae5c57c322ddf66710273fa775168fddf4cc7c1318992986b50df72c8b1c7f85')

build() {
  cd "$srcdir/$pkgname"
  find . -type f -iname "*.sh" -exec chmod +x {} \; 
  ./autogen.sh
  ./configure --with-gui=qt5
  make
}


package() {
  install -Dm644 infinex-qt.desktop "$pkgdir"/usr/share/applications/infinex.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/infinex-qt "$pkgdir"/usr/bin/infinex-qt
  install -Dm644 share/pixmaps/infinex128.png "$pkgdir"/usr/share/pixmaps/infinex128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
