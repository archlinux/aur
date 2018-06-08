# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=raven-qt
pkgver=0.15.99
pkgrel=1
arch=('i686' 'x86_64')
url="https://ravencoin.org/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(raven)
install=raven-qt.install
source=("${pkgname%-git}::git+http://github.com/RavenProject/Ravencoin.git"
        "$pkgname.desktop")
sha256sums=('SKIP'
            'e318e3c5a9fbdbcf5836f9ceee76f4a73acdcb47c535cb7beb1c19937b8540df')

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --with-gui=qt5
  make
}


package() {
  install -Dm644 raven-qt.desktop "$pkgdir"/usr/share/applications/raven.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/raven-qt "$pkgdir"/usr/bin/raven-qt
  install -Dm644 share/pixmaps/raven128.png "$pkgdir"/usr/share/pixmaps/raven128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
