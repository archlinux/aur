# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=mir-core
pkgname=d-$_pkgname
pkgver=0.2.1
pkgrel=3
pkgdesc='Base software building blocks and conventions for libmir'
arch=('x86_64')
url='https://github.com/libmir/mir-core'
license=('custom:BSL')
depends=('liblphobos')
makedepends=('meson' 'ldc')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('26d1ef401118cd9da069dd45a2e6717974c0de48a12cac4b2c44400962ae10a39180f4606c73dde0d06cee31af034c1d5f9f7ba09a88e775b12836ee0f24eaac')

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

  install -Dm 644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

