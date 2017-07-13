#Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=hogc
pkgver=0.0.1
pkgrel=11
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

sha512sums=('d51167bd6b32a45262e14caf8d58c9fce34e463cd40e9b9e82048eb93ec14306fdbc75ce520ff95eb1cf2851379a57e4717b75d41a51501e7c2a3bdeb026ad93')
