# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=davies-qt
pkgver=1.0.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://daviescoin.io/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(davies)
install=davies-qt.install
source=("${pkgname%-git}::git+https://github.com/devdavies/daviescoin.git#tag=v${pkgver}"
        "$pkgname.desktop")
sha256sums=('SKIP'
            'd833c556e50d74df856da2b85ef26fa07ebf72a91412191591b20e799177f019')

build() {
  cd "$srcdir/$pkgname"
  find . -type f -iname "*.sh" -exec chmod +x {} \; 
  ./autogen.sh
  ./configure --with-gui=qt5 --disable-tests
  make
}


package() {
  install -Dm644 davies-qt.desktop "$pkgdir"/usr/share/applications/davies.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/davies-qt "$pkgdir"/usr/bin/davies-qt
  install -Dm644 share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/davies128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
