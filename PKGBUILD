# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=corez-qt
pkgver=0.12.1
pkgrel=3
arch=('i686' 'x86_64')
url="http://corez.site/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(corez)
install=corez-qt.install
source=("${pkgname%-git}::git+http://github.com/corezcrypto/corez.git"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '09b0e17970b210dab6fcc4389ac0454a6310f85e45710af06ddbfebb923881f3')

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --with-gui=qt5
  make
}


package() {
  install -Dm644 corez-qt.desktop "$pkgdir"/usr/share/applications/corez.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/corez-qt "$pkgdir"/usr/bin/corez-qt
  install -Dm644 share/pixmaps/corez128.png "$pkgdir"/usr/share/pixmaps/corez128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
