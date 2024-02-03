# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=kpeople
pkgname=${_name}5
pkgver=5.115.0
pkgrel=1
pkgdesc='A library that provides access to all contacts and the people who hold them'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kcoreaddons5 ki18n5 kwidgetsaddons5 kitemviews5)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc qt5-declarative)
optdepends=('qt5-declarative: QML bindings')
conflicts=("$_name<5.111")
replaces=("$_name<5.111")
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('b8c1812ced1b5d58e3728defa1c9eab4376e3fd5684ae9441f2564129a96712f'
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
