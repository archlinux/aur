# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-screen-library
pkgver=6.7.2
pkgrel=1
pkgdesc='SonicDE screen management library'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-screen-library'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         libxcb
         qt6-base)
makedepends=(qt6-tools
             sonic-frameworks-cmake-modules)
provides=(libkscreen)
conflicts=(libkscreen)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4b843a9fde8a6bc808e3583eb90d40af8bdfb3f2481820d998093da55b1b5356')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
