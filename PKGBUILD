# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=lunex-qt
pkgver=1.0.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://www.lunexcrypto.com/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(lunex)
install=lunex-qt.install
source=("${pkgname%-git}::git+https://github.com/LunexCoin/Lunex.git"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '4134c65aff7b77fb52da75b9dcaf8457efac88f4bcb214a8116803e99d7c9050')

build() {
  cd "$srcdir/$pkgname"
  find . -type f -iname "*.sh" -exec chmod +x {} \; 
  ./autogen.sh
  ./configure --with-gui=qt5
  make
}


package() {
  install -Dm644 lunex-qt.desktop "$pkgdir"/usr/share/applications/lunex.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/lunex-qt "$pkgdir"/usr/bin/lunex-qt
  install -Dm644 share/pixmaps/dash128.png "$pkgdir"/usr/share/pixmaps/lunex128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
