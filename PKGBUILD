# Maintainer: birdflesh <antkoul at gmail dot com>

pkgname=kdeplasma-applets-homerun
_pkgname=homerun
pkgver=1.2.5
pkgrel=1
pkgdesc="An application launcher for KDE Plasma desktop"
arch=('i686' 'x86_64')
url="http://userbase.kde.org/Homerun"
license=('GPL' 'LGPL' 'BSD')
depends=('kdebase-workspace' 'kdebase-lib')
makedepends=('cmake' 'automoc4')
conflicts=('kdeplasma-applets-homerun-git')
install=$pkgname.install
source=("http://download.kde.org/stable/$_pkgname/src/$_pkgname-$pkgver.tar.xz")
md5sums=('86ebece69eae72c548adf40da02aa354')

build() {
  cd "$srcdir"
  mkdir build
  cd build
  cmake ../$_pkgname-$pkgver \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE.BSD" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
