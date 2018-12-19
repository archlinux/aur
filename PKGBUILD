# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=d-containers
_pkgname=containers
_pkgver=0.8.0-alpha.11
pkgver=${_pkgver/-/}
pkgrel=2
pkgdesc='Containers for D backed by std.experimental.allocator'
arch=('x86_64')
url='https://github.com/dlang-community/containers'
license=('Boost')
depends=('liblphobos')
makedepends=('meson' 'ldc' 'd-stdx-allocator')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha512sums=('7673c677bdab87b3e4fbf7b64532f005fc31e428f18b0db1199f5376125303acdd65579e85d6a7182c47916f10ef7d421b0cc388d74eca4658167701eef98864')

build() {
  mkdir -p $_pkgname-$_pkgver/build
  cd $_pkgname-$_pkgver/build

  # Force build with LDC
  export DC=ldc

  arch-meson ..

  ninja
}

check() {
  cd $_pkgname-$_pkgver/build

  ninja test
}

package() {
  cd $_pkgname-$_pkgver/build

  DESTDIR="$pkgdir" ninja install
}

