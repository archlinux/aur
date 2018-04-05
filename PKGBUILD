# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=d-containers
_pkgver=0.8.0-alpha.5
pkgver=${_pkgver/-/}
pkgrel=1
pkgdesc="Containers for D backed by std.experimental.allocator"
arch=(x86_64)
url="https://github.com/dlang-community"
license=(Boost)
depends=(libphobos)
makedepends=(dmd libphobos meson d-stdx-allocator)
source=($pkgname-$pkgver.tar.gz::"https://github.com/dlang-community/containers/archive/v$_pkgver.tar.gz")
sha256sums=('30f82f85d573cf0d3d21bd53f7b9a813ac80fc3e2cfe1fbe6da4e31f237afad7')

prepare() {
  mkdir -p build
}

build() {
  cd build
  meson ../containers-$_pkgver --prefix=/usr
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}
