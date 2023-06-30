# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdewebkit
pkgver=5.107.0
pkgrel=1
pkgdesc='KDE Integration for QtWebKit'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(qt5-webkit kparts)
makedepends=(extra-cmake-modules qt5-tools)
provides=('kdewebkit-debug')
groups=(kf5-aids)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/portingAids/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('65502819b5cd0056cc0fe041b8fa7da3a703fc3222f8785f035f25613ad4b637'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>
options=(debug)

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
