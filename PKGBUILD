# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=d-containers
_pkgname=containers
_pkgver=0.8.0-alpha.10
pkgver=${_pkgver/-/}
pkgrel=1
pkgdesc='Containers for D backed by std.experimental.allocator'
arch=('x86_64')
url='https://github.com/dlang-community/containers'
license=('Boost')
depends=('liblphobos')
makedepends=('meson' 'ldc' 'd-stdx-allocator')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha512sums=('dd5a119aa542e0fa9c48f2a25c6d53f1fd366a5dfde4e9576f7f86a710f669d9c8195e927035f3977aaf48b9b7ae8222f8ba6250c6ecb8780684b794afc7af32')

build() {
  mkdir -p $_pkgname-$_pkgver/build
  cd $_pkgname-$_pkgver/build

  # Force build with LDC
  export DC=ldc

  arch-meson ..

  ninja
}

package() {
  cd $_pkgname-$_ppkgver/build

  DESTDIR="$pkgdir" ninja install
}

