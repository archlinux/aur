# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=d-containers
_pkgver=0.8.0-alpha.7
pkgver=${_pkgver/-/}
pkgrel=1
pkgdesc="Containers for D backed by std.experimental.allocator"
arch=(x86_64)
url="https://github.com/dlang-community"
license=(Boost)
depends=(libphobos)
makedepends=(dmd meson d-stdx-allocator)
source=($pkgname-$pkgver.tar.gz::"https://github.com/dlang-community/containers/archive/v$_pkgver.tar.gz")
sha256sums=('27490c8267bd7c88c31da1aeb9dc1d7ba30d8bccca4e974235099590d660111c')

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
