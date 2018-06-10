# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=nyx-qt
pkgver=2.0.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://www.nyxcoin.org/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(nyx)
install=nyx-qt.install
source=("${pkgname%-git}::git+https://github.com/nyxpay/nyx.git"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '7a3f0fd246b496e66288f2b1d2cd48a6ebed816ed070ec0a524b81e755a84286')

build() {
  cd "$srcdir/$pkgname"
  find . -type f -iname "*.sh" -exec chmod +x {} \; 
  ./autogen.sh
  ./configure --with-gui=qt5
  make
}


package() {
  install -Dm644 nyx-qt.desktop "$pkgdir"/usr/share/applications/nyx.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/nyx-qt "$pkgdir"/usr/bin/nyx-qt
  install -Dm644 share/pixmaps/nyx128.png "$pkgdir"/usr/share/pixmaps/nyx128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
