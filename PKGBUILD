#Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=hogc
pkgver=0.0.1
pkgrel=3
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

sha512sums=('74e2ca3f9c90f701482e81dd1c2566d14564aa604b3ed7a4285b9d4ddb25297007661e79db3b5bf102cbbf9f127ccdefd49a804ae71c92619ea7772c30cf4fa4')
