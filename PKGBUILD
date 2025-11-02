# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_name=networkmanager-qt
pkgname=${_name}5
pkgver=5.116.0
pkgrel=2
pkgdesc='Qt wrapper for NetworkManager API'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(networkmanager qt5-base)
makedepends=(extra-cmake-modules)
conflicts=("$_name<5.111")
replaces=("$_name<5.111")
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('0b4e80a4e110776b2f7bcbd4f6371ccbd8d9ed58f01c8a3738ce9c8ef1601b69'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

build() {
  cmake -B build -S $_name-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
