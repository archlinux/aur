# Maintainer: Mark Tompkins <mets_dev@outlook.com>

pkgname=pigeon-qt
pkgver=0.15.99
pkgrel=2
arch=('i686' 'x86_64')
url="http://pigeoncoin.org/"
license=('MIT')
pkgdesc="Peer-to-peer network based digital currency (QT)"
depends=(boost-libs qt5-base db4.8 zeromq miniupnpc qrencode protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(pigeon)
install=pigeon-qt.install
source=("${pkgname%-git}::git+http://github.com/Pigeoncoin/pigeoncoin.git"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '331bd8fb38aae6d94a0e7494ff183f8d918eeb6d143ffcfa8ca61546338f265d')

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --with-gui=qt5
  make
}


package() {
  install -Dm644 pigeon-qt.desktop "$pkgdir"/usr/share/applications/pigeon.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/pigeon-qt "$pkgdir"/usr/bin/pigeon-qt
  install -Dm644 share/pixmaps/pigeon128.png "$pkgdir"/usr/share/pixmaps/pigeon128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
