# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=d-containers
_pkgver=0.8.0-alpha.10
pkgver=${_pkgver/-/}
pkgrel=1
pkgdesc="Containers for D backed by std.experimental.allocator"
arch=(x86_64)
url="https://github.com/dlang-community"
license=(Boost)
depends=(liblphobos)
makedepends=(ldc meson d-stdx-allocator)
source=($pkgname-$pkgver.tar.gz::"https://github.com/dlang-community/containers/archive/v$_pkgver.tar.gz")
sha256sums=('40210406e4439c4145c951a24b8475af47fe981e0a95122db05d6eff3cce7561')

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
