# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-unikey
pkgver=0.2.2
pkgrel=2
pkgdesc="Fcitx Wrapper for unikey"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx>=4.2.8')
optdepends=('qt4: To run the fcitx unikey macro editor')
makedepends=('cmake' 'qt4')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz")
install=fcitx-unikey.install

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DQT_QMAKE_EXECUTABLE=qmake-qt4 ..
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  # Fix desc missing problem
  install -Dm644 ../src/fcitx-unikey.desc "$pkgdir/usr/share/fcitx/configdesc/fcitx-unikey.desc"
}

sha512sums=('71a0773222b1172943f80bce904da77c136225981a0580d937327829c8d734fc65d9c4afa5275bd210ca837d7a7b9d8bfb18df96f62710068b9883a22499fbfb')
