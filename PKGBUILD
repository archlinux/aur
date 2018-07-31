# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=methuselah-qt
pkgver=1.1.0
pkgrel=4
arch=('i686' 'x86_64')
url="https://methuselahcoin.io/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(methuselah)
install=methuselah-qt.install
source=("${pkgname%-git}::git+http://github.com/methuselah-coin/methuselah.git#tag=v1.1.0.4"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '506ed6d06a242611f79055413136a4a684da7ad788c3555b482e37f013590ee5')

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --with-gui=qt5
  make
}


package() {
  install -Dm644 methuselah-qt.desktop "$pkgdir"/usr/share/applications/methuselah.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/methuselah-qt "$pkgdir"/usr/bin/methuselah-qt
  install -Dm644 share/pixmaps/methuselah128.png "$pkgdir"/usr/share/pixmaps/methuselah128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
