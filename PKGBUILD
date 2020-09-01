# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=calligra-plan
pkgdesc="A project management application intended for managing moderately large projects with multiple resources"
pkgver=3.2.2
pkgrel=2
arch=(x86_64)
url='https://www.calligra-suite.org/'
license=(FDL1.2 GPL2 LGPL)
depends=(kinit akonadi-contacts kdiagram kactivities kholidays kcalendarcore khtml qca)
makedepends=(extra-cmake-modules kdoctools boost)
conflicts=('calligra<3.1.0')
source=("https://download.kde.org/stable/calligra/$pkgver/calligraplan-$pkgver.tar.xz"{,.sig}
         calligra-plan-qt-5.15.patch::"https://invent.kde.org/office/calligraplan/-/commit/f77fb06d.patch")
sha256sums=('e10c6f4a6fbf40da422d98d5138201f7db52236181c25641402e4ae4b0add336'
            'SKIP'
            '4ea0f9e0dc2a6336120d2cd7907de127a10b690254b522b5bb082d200f03bc55')
validpgpkeys=(05D00A8B73A686789E0A156858B9596C722EA3BD  # Boudewijn Rempt <foundation@krita.org>
              42A60D06F449E895F40F09C01638B8A616108B8A) # Dag Andersen <danders@get2net.dk>

prepare() {
  patch -d calligraplan-$pkgver -p1 -i ../calligra-plan-qt-5.15.patch # Fix build with Qt 5.15
}

build() {
  cmake -B build -S calligraplan-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
