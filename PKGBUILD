# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=stdx-allocator
pkgname=d-$_pkgname
pkgver=3.0.2
pkgrel=1
pkgdesc='Extracted std.experimental.allocator'
arch=('x86_64')
url='https://github.com/dlang-community/stdx-allocator'
license=('Boost')
depends=('liblphobos' 'd-mir-core')
makedepends=('meson' 'ldc')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f4dc887225926cc4530314976e5e236c696a54c6e2ccdb48271b97b0c0a70882b70e92768c94c2932ccc9bd2282c3e953b27cf72088904458f7fc15234dca4be')

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

