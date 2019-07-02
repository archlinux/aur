# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=d-containers
_pkgname=containers
_pkgver=0.8.0-alpha.13
pkgver=${_pkgver/-/}
pkgrel=2
pkgdesc='Containers for D backed by std.experimental.allocator'
arch=('x86_64')
url='https://github.com/dlang-community/containers'
license=('Boost')
depends=('liblphobos')
makedepends=('meson' 'ldc' 'd-stdx-allocator')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha512sums=('15615efe538396130d07d8ec93f552945908edd58a3bb4bed27c22d9c42b4d9fc8c9f665aac946994e53a2f04f1bb59b3dc6546151a0cbd45e7fd60ce9b48d87')

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

