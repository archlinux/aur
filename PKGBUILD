# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=mct-qt
pkgver=18.0.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://mct.plus/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(mct)
install=mct-qt.install
source=("${pkgname%-git}::git+https://github.com/mctsystem/mct-coin.git"
        "$pkgname.desktop")
sha256sums=('SKIP'
            'f04285f5b82b65f41949eb15302f92b5ef17a54bf3b3f79044b398a8e9976b47')

build() {
  cd "$srcdir/$pkgname"
  find . -type f -iname "*.sh" -exec chmod +x {} \; 
  ./autogen.sh
  ./configure --with-gui=qt5
  make
}


package() {
  install -Dm644 mct-qt.desktop "$pkgdir"/usr/share/applications/mct.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/mct-qt "$pkgdir"/usr/bin/mct-qt
  install -Dm644 share/pixmaps/mct128.png "$pkgdir"/usr/share/pixmaps/mct128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
