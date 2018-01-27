# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=calligra-plan
pkgdesc="A project management application intended for managing moderately large projects with multiple resources"
pkgver=3.1.0
pkgrel=1
arch=(x86_64)
url='https://www.calligra-suite.org/'
license=(FDL1.2 GPL2 LGPL)
depends=(kinit kcmutils akonadi-contacts kdiagram kactivities kholidays kcalcore khtml)
makedepends=(extra-cmake-modules kdoctools boost)
conflicts=('calligra<3.1.0')
source=("https://download.kde.org/stable/calligra/$pkgver/calligraplan-$pkgver.tar.xz"{,.sig})
sha256sums=('59f985bae0482789c13c9440af3bf5da0a1d04756c1c1ccf39f68f66cd3e7ddd'
            'SKIP')
validpgpkeys=(05D00A8B73A686789E0A156858B9596C722EA3BD  # Boudewijn Rempt <foundation@krita.org>
              42A60D06F449E895F40F09C01638B8A616108B8A) # Dag Andersen <danders@get2net.dk>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../calligraplan-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
