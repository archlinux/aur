# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=kholidays
pkgname=${_name}5
pkgver=5.116.0
pkgrel=1
epoch=1
pkgdesc='KDE library for regional holiday information'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(qt5-base)
makedepends=(extra-cmake-modules qt5-declarative qt5-tools qt5-doc doxygen)
optdepends=('qt5-declarative: QML bindings')
conflicts=("$_name<1:5.111")
replaces=("$_name<1:5.111")
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('898fa19e4dbd089a4b00693b8226982f5cbb1751cf4fa21565eb93141b15fdc0'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

build() {
  cmake -B build -S $_name-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
