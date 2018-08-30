# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=resq-qt
pkgver=1.0.1.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://ravencoin.org/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(resq)
install=resq-qt.install
source=("${pkgname%-git}::git+https://github.com/RESQ-Chain/resq-chain.git#tag=v${pkgver}"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '02008d8837e3e9200be5d87dc55f8396bae49a07ad614ee085712490ec67236a')

build() {
  cd "$srcdir/$pkgname"
  find . -type f -iname "*.sh" -exec chmod +x {} \; 
  ./autogen.sh
  chmod +x ./configure
  ./configure --with-gui=qt5 --disable-tests
  make
}


package() {
  install -Dm644 resq-qt.desktop "$pkgdir"/usr/share/applications/resq.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/resq-qt "$pkgdir"/usr/bin/resq-qt
  install -Dm644 share/pixmaps/resq128.png "$pkgdir"/usr/share/pixmaps/resq128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
