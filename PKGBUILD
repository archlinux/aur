#Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=hogc
pkgver=0.0.1
pkgrel=4
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

sha512sums=('b9009e645bf68bb382987588cea48bc20e5ef8e7a5401fe82a4bd6a18f685d577ba78fc25ede35ca9884b0bb6cdaa3196b3cff745134fe107d8cf9da97e361be')
