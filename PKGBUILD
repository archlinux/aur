# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=d-containers
_pkgver=0.8.0-alpha.9
pkgver=${_pkgver/-/}
pkgrel=3
pkgdesc="Containers for D backed by std.experimental.allocator"
arch=(x86_64)
url="https://github.com/dlang-community"
license=(Boost)
depends=(libphobos)
makedepends=(dmd meson d-stdx-allocator)
source=($pkgname-$pkgver.tar.gz::"https://github.com/dlang-community/containers/archive/v$_pkgver.tar.gz")
sha256sums=('b2f42be8c70910f87bf4cf864895375c0407065273c9e8ecb4ae004a4b26c009')

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
