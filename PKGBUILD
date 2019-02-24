# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=stdx-allocator
pkgname=d-$_pkgname
pkgver=3.0.1
pkgrel=3
pkgdesc='Extracted std.experimental.allocator'
arch=('x86_64')
url='https://github.com/dlang-community/stdx-allocator'
license=('Boost')
depends=('liblphobos' 'd-mir-core')
makedepends=('meson' 'ldc')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9a2b7c5efeba9b1080580769cf753691ec57361090803376d297cfb878206dfb')

build() {
  mkdir $_pkgname-$pkgver/build
  cd $_pkgname-$pkgver/build

  export DC=ldc

  arch-meson ..

  ninja
}

check() {
  cd $_pkgname-$pkgver/build

  meson test
}

package() {
  cd $_pkgname-$pkgver/build

  DESTDIR="$pkgdir" ninja install
}

