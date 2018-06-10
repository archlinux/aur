# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=motion-qt
pkgver=0.1.2
pkgrel=1
arch=('i686' 'x86_64')
url="https://motionproject.org/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(motion)
install=motion-qt.install
source=("${pkgname%-git}::git+https://github.com/motioncrypto/motion.git"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '75f7adb39803ab719789d0aefd0c174600bcc758db49c8ee47b203b1e83474a4')

build() {
  cd "$srcdir/$pkgname"
  find . -type f -iname "*.sh" -exec chmod +x {} \; 
  ./autogen.sh
  ./configure --with-gui=qt5
  make
}


package() {
  install -Dm644 motion-qt.desktop "$pkgdir"/usr/share/applications/motion.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/motion-qt "$pkgdir"/usr/bin/motion-qt
  install -Dm644 share/pixmaps/motion128.png "$pkgdir"/usr/share/pixmaps/motion128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
