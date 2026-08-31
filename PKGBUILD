# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-io-fuse
pkgver=6.0.0
pkgrel=2
arch=(x86_64)
pkgdesc='FUSE interface for KIO'
url='https://github.com/Sonic-DE/sonic-frameworks-io-fuse'
license=(GPL-3.0-or-later)
depends=(fuse3
         glibc
         libstdc++
         qt6-base
         sonic-frameworks-core-addons
         sonic-frameworks-io)
makedepends=(sonic-frameworks-cmake-modules)
provides=(kio-fuse)
conflicts=(kio-fuse)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a6f414d9aec161f5071464dd46753b445c87b15653925362d5110a0c72f927a3')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
