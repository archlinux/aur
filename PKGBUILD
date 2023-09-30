# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=kholidays
pkgname=${_name}5
pkgver=5.110.0
pkgrel=2
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
provides=($_name=$pkgver)
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('4c56346b5047c722e43a5449e1fef7dad2a68371b71894fcc37c2416ab54337e'
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
