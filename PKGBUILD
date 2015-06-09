# Maintainer: birdflesh <antkoul at gmail dot com>

pkgname=mangonel
pkgver=1.1
pkgrel=1
pkgdesc="A simple and pretty application launcher for KDE"
arch=('i686' 'x86_64')
url='https://projects.kde.org/mangonel'
license=('BSD')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4')
source=("http://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz")
md5sums=('5d2cabafcddd054e04f62dedcce4c156')

build() {
  cd "$srcdir"
  mkdir build
  cd build
  cmake ../$pkgname-$pkgver \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
