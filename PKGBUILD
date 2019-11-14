# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=calligra-plan
pkgdesc="A project management application intended for managing moderately large projects with multiple resources"
pkgver=3.2.0
pkgrel=1
arch=(x86_64)
url='https://www.calligra-suite.org/'
license=(FDL1.2 GPL2 LGPL)
depends=(kinit kcmutils akonadi-contacts kdiagram kactivities kholidays kcalendarcore khtml qca-qt5)
makedepends=(extra-cmake-modules kdoctools boost)
conflicts=('calligra<3.1.0')
source=("https://download.kde.org/stable/calligra/$pkgver/calligraplan-$pkgver.tar.xz"{,.sig})
sha256sums=('a12995a129b3c13cd8a12e8efe17a27be86bc42afefc5cb2c62d6797ed4301ce'
            'SKIP')
validpgpkeys=(05D00A8B73A686789E0A156858B9596C722EA3BD  # Boudewijn Rempt <foundation@krita.org>
              42A60D06F449E895F40F09C01638B8A616108B8A) # Dag Andersen <danders@get2net.dk>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../calligraplan-$pkgver \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
