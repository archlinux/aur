# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kinit
pkgver=5.100.0
pkgrel=1
pkgdesc='Process launcher to speed up launching KDE applications'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kio)
makedepends=(extra-cmake-modules kdoctools)
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig})
install=kinit.install
sha256sums=('89112dd9cebba4c917b915b839afbc01dbfdb80bb71c61d9575fec06445bf2ce'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>
options=(debug)

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
