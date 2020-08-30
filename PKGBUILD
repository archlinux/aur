# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=mir-core
pkgname=d-$_pkgname
pkgver=1.1.10
pkgrel=1
pkgdesc='Base software building blocks and conventions for libmir'
arch=('x86_64')
url='https://github.com/libmir/mir-core'
license=('custom:BSL')
depends=('liblphobos')
makedepends=('meson' 'ldc')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7c913c3b37a11de4b6f22934bcb7e7de8a9a31668c7b8b335e8a98448bbbf1553f4c7922ef9399b7127c9388f1edc96b0cd1ff549cd885742f5164e1b072bff8')

prepare() {
  cd $_pkgname-$pkgver

  # Fix version in buildfile
  sed -i "s/1.1.1/$pkgver/" meson.build
}

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

