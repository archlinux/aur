# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kinit
pkgver=5.90.0
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
sha256sums=('2a3858eeb80b044e884bdc77e110e7ecb34cdb91575c544a95502123a183c57c'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
