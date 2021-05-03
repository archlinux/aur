# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=diet-ng
pkgver=1.7.4
pkgrel=2
pkgdesc='Generic compile-time template system based on an XML-like structure for D'
arch=('x86_64')
url='https://github.com/rejectedsoftware/diet-ng'
license=('MIT')
depends=('liblphobos')
makedepends=('meson' 'ldc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('94ceb88d5258ab972ad85e71276a38d4ee64cd3373acebff612c09fe1819e7ef137204ab25d7694de01f402bf128893f29628149f7af1613015fcf3d8ec59ece')

build() {
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build

  export DC=ldc

  arch-meson ..

  ninja
}

check() {
  cd $pkgname-$pkgver/build

  ninja test
}

package() {
  cd $pkgname-$pkgver/build

  DESTDIR="$pkgdir" ninja install

  install -Dm 644 ../LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

