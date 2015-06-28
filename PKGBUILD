# Maintainer: Loïc Guitaut <flink at belfalas dot eu>

pkgname='offerings-to-cthulhu-qt'
pkgver=1.4.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://cthulhu.tk/"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc')
license=('MIT')
pkgdesc="Offerings to Cthulhu (QT)"
depends=(boost-libs qt4 miniupnpc qrencode)
install=offerings-to-cthulhu-qt.install
source=("https://github.com/thegreatoldone/offerings/archive/67bad1c7ad3f0126a49a5a5166bd744c1b085cad.zip"
        "$pkgname.desktop")
sha256sums=('6da2bbb1cfabe70029c5aab659ef08b91dd923cd89a6bc1e0ad3ab8ef7ae23f8'
            '3a99b2c67c9893e0154d76e2b7e3acd96be81c1de9e580691e864c8cfce58e10')
conflicts=(offerings-qt)

build() {
  cd "$srcdir/offerings-67bad1c7ad3f0126a49a5a5166bd744c1b085cad"

  # and make qt gui
  qmake-qt4 USE_QRCODE=1 USE_UPNP=1
  make
}


package() {
  install -Dm644 offerings-to-cthulhu-qt.desktop "$pkgdir"/usr/share/applications/offerings-to-cthulhu.desktop
  cd "$srcdir/offerings-67bad1c7ad3f0126a49a5a5166bd744c1b085cad"
  install -Dm755 Offerings-qt "$pkgdir"/usr/bin/offerings-qt
  install -Dm644 src/qt/res/icons/bitcoin.png "$pkgdir"/usr/share/pixmaps/offerings128.png

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

