#Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=hogc
pkgver=0.0.1
pkgrel=8
pkgdesc="human detection in C++ and opencv"
arch=('any')
url="https://github.com/Chipsterjulien/hogc"
license=('WTFPL')
makedepends=('opencv' 'cmake')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz")
install=hogc.install

_builddir="$pkgname-$pkgver"

build() {
  cd "$_builddir"
  # run cmake .
  cmake . || return 1
  # run make
  make || return 1
}

package() {
  cd "$_builddir"

  # hogc_sample.ini
  install -Dm644 cfg/"$pkgname"_sample.ini \
    "$pkgdir"/etc/$pkgname/"$pkgname"_sample.ini || return 1

  # hogc binary
  install -m755 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname \
      "$pkgdir"/usr/bin/$pkgname || return 1
}

sha512sums=('f267f9ed22ccbff8baa89bb4289eea7ecd8435ab138d8e89f39e989d6f2d1fc0ac92c91ab7ad11725d3de2788131ded65111a79c06e71803f7a78fd9fa702cda')
