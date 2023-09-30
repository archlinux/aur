# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_name=kitemmodels
pkgname=${_name}5
pkgver=5.110.0
pkgrel=1
pkgdesc='Models for Qt Model/View system'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(qt5-base)
makedepends=(extra-cmake-modules clang doxygen qt5-tools qt5-doc qt5-declarative)
optdepends=('qt5-declarative: QML bindings')
conflicts=("$_name<5.111")
replaces=("$_name<5.111")
provides=($_name=$pkgver)
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('123a7f4511f74f4a20aebf4d7194bfe46c71bdf3d3c3cc4864d71262c6a8fe19'
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
