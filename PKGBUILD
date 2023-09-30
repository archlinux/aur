# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_name=networkmanager-qt
pkgname=${_name}5
pkgver=5.110.0
pkgrel=1
pkgdesc='Qt wrapper for NetworkManager API'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(networkmanager qt5-base)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc)
conflicts=("$_name<5.111")
replaces=("$_name<5.111")
provides=($_name=$pkgver)
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('1837f9b4795124f7fb0e63d75ea8f29b575e5a9f3ff5ae5e26861a0eddddd4ae'
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
