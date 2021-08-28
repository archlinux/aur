# Maintainer: Posi <posi1981@gmail.com>

pkgname=actinium-qt
pkgver=0.19.0.6
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
sha256sums=('6ff14218a4a7f1cd5167c4fa944fb3f8ce69437f3fbe80302a4b6836013240c9')

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
