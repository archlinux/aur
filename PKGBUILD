# Maintainer: artist for Artix Linux

pkgname=sonic-screen-library 
pkgver=6.6.2
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=2
pkgdesc='Screen management library for SonicDE Workspaces'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-screen-library'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         libxcb
         qt6-base)
makedepends=(extra-cmake-modules
             plasma-wayland-protocols
             qt6-tools)
groups=(sonicde)
conflicts=(libkscreen)
provides=(libkscreen)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

sha256sums=('95c87b29da0a73488c2e2c539d73cc07c9bd873635177514423ebd1326b09776')
