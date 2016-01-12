# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>
pkgname=kdreports
pkgver=1.7.0
pkgrel=1
pkgdesc="A Qt library for creating printable reports"
arch=('i686' 'x86_64')
url="http://www.kdab.com/kd-reports/"
license=('GPL' 'LGPL' 'custom')
depends=('qt5-base')
makedepends=('cmake>=2.8.11')
source=("$pkgname-$pkgver.tar.gz::https://github.com/KDAB/KDReports/releases/download/kdreports-$pkgver/kdreports-$pkgver.tar.gz")
sha512sums=('7d9376dcd15ff39d9ecb872dbbe02ff821b24b16f813ef2fe642479628fce707a65f7f3bd81133d8875d7562ead124fb2c1fcc5999dcc3f5b5f0b846d9ba6da9')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DKDReports_TESTS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR="$pkgdir/" install
  cd $pkgname-$pkgver
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
  install -Dm644 LICENSE.US.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.US.txt
  install -Dm644 LICENSE.GPL.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.GPL.txt
  install -Dm644 LICENSE.LGPL.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.LGPL.txt
}
