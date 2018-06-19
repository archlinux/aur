# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=d-containers
_pkgver=0.8.0-alpha.8
pkgver=${_pkgver/-/}
pkgrel=1
pkgdesc="Containers for D backed by std.experimental.allocator"
arch=(x86_64)
url="https://github.com/dlang-community"
license=(Boost)
depends=(libphobos)
makedepends=(dmd meson d-stdx-allocator)
source=($pkgname-$pkgver.tar.gz::"https://github.com/dlang-community/containers/archive/v$_pkgver.tar.gz")
sha256sums=('e4e0bb2fcbfa38a8a4101175d39e279172e98a147ad8ca716365407d969c7809')

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
