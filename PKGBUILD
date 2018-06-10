# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=rabbit-qt
pkgver=1.0.2
pkgrel=2
arch=('i686' 'x86_64')
url="http://rabbitcore.org/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(rabbit)
install=rabbit-qt.install
source=("${pkgname%-git}::git+https://github.com/RabbitcoreDEV/RabbitCore"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '19a36e7c1b520bcd14d967ac90be69837a570324562a96a3ce898999b76f956d')

build() {
  cd "$srcdir/$pkgname"
  chmod +x ./autogen.sh
  chmod +x ./share/genbuild.sh
  ./autogen.sh
  ./configure --with-gui=qt5
  make
}


package() {
  install -Dm644 rabbit-qt.desktop "$pkgdir"/usr/share/applications/rabbit.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/rabbit-qt "$pkgdir"/usr/bin/rabbit-qt
  install -Dm644 share/pixmaps/proton128.png "$pkgdir"/usr/share/pixmaps/rabbit128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
