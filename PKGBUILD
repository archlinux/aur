# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-quick-image-editor
pkgver=0.7.0.1
pkgrel=2
pkgdesc='QML image editing components with SonicDE defaults'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-quick-image-editor'
license=(LGPL-2.1-or-later)
depends=(glibc
         kconfig
         libgcc
         libstdc++
         opencv
         qt6-base
         qt6-declarative
         sonic-frameworks-quick-ui)
makedepends=(sonic-frameworks-cmake-modules
             qt6-shadertools)
provides=(kquickimageeditor)
conflicts=(kquickimageeditor)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ac92df06d7c938783d795de793c68d0e3baf7567977b46afa7dcc0070857dc54')

prepare() {
  sed -e 's|OpenCV 4.7|OpenCV 5|' -i $pkgname-$pkgver/CMakeLists.txt
}

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
