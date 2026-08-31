# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-quick-image-editor
pkgver=0.6.2.1.1
pkgrel=1
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
makedepends=(sonic-frameworks-cmake-modules)
provides=(kquickimageeditor)
conflicts=(kquickimageeditor)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6f695834bdeea7cece70038c0b81437e36c614f7978f902a1b7885be67965623')

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
