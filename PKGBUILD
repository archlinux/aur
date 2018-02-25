# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=aom
pkgver=0.1.0
pkgrel=4
pkgdesc="An open, royalty-free video coding format designed for video transmissions over the Internet"
arch=('i686' 'x86_64')
url="http://aomedia.org/"
license=('BSD' 'custom:PATENTS')
depends=('gcc-libs')
makedepends=('git' 'perl' 'yasm')
conflicts=('libvpx')
source=("git+https://aomedia.googlesource.com/aom#tag=v$pkgver")
sha256sums=('SKIP')


prepare() {
  cd "$srcdir"

  mkdir -p "build"
}

build() {
  cd "$srcdir/build"

  "$srcdir/$pkgname"/configure --prefix="/usr" --enable-pic --disable-unit-tests
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  cd "$srcdir/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "PATENTS" "$pkgdir/usr/share/licenses/$pkgname/PATENTS"
}
