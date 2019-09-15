# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=d-containers
_pkgname=containers
_pkgver=0.8.0-alpha.16
pkgver=${_pkgver/-/}
pkgrel=2
pkgdesc='Containers for D backed by std.experimental.allocator'
arch=('x86_64')
url='https://github.com/dlang-community/containers'
license=('Boost')
depends=('liblphobos')
makedepends=('meson' 'ldc' 'd-stdx-allocator')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha512sums=('7e88106456a477ef188a86bbe163ec04bda473cede4f8e0082bcd0d9dd9adf9c74b4d9f948dc2340f82a257683d9d4b17bb463053c56a548d1a62c304404b065')

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

