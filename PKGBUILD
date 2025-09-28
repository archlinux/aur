# Maintainer: Andras Baumann <mail@andreasbaumann.cc>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_name=plasma-framework
pkgname=${_name}5
pkgver=5.116.0
pkgrel=2
pkgdesc='Plasma library and runtime components based upon KF5 and Qt5'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kactivities5 kdeclarative5 kglobalaccel5 kwayland5 kirigami2)
makedepends=(extra-cmake-modules qt5-tools qt5-doc kdoctools5 doxygen)
conflicts=("$_name<5.111")
replaces=("$_name<5.111")
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('7e932c4da5f527206ce07d3b145231ef396a3d22441edcd24deeaf9dac509f4f'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

build() {
  cmake -B build -S $_name-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_DESKTOPTHEMES=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
