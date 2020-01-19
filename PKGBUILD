# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=actinium-qt
pkgver=0.18.5.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://actinium.org/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(actinium)
install=actinium-qt.install
source=("${pkgname%-git}::git+https://github.com/Actinium-project/Actinium#tag=v${pkgver}"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '20fe70ed4c00da0affc763f3f914dee9e061c8673d598a0d49f6b782aa2d1a70')

build() {
  cd "$srcdir/$pkgname"
  find . -type f -iname "*.sh" -exec chmod +x {} \; 
  ./autogen.sh
  ./configure --with-gui=qt5 --disable-tests
  make
}


package() {
  install -Dm644 actinium-qt.desktop "$pkgdir"/usr/share/applications/actinium.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/Actinium-qt "$pkgdir"/usr/bin/actinium-qt
  install -Dm644 share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/actinium128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
