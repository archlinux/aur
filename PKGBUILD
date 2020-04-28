# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=mir-core
pkgname=d-$_pkgname
pkgver=1.1.3
pkgrel=1
pkgdesc='Base software building blocks and conventions for libmir'
arch=('x86_64')
url='https://github.com/libmir/mir-core'
license=('custom:BSL')
depends=('liblphobos')
makedepends=('meson' 'ldc')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a610e826371484b212f5d7c85a8354c39357d178b142806649b9297121b231021737168cac6ea30ad0ecbbcb25d1545504b4c6ce060dddbecdb83c65000e5895')

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

