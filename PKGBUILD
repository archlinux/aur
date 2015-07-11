# Maintainer: Hannes Graeuler <hgraeule @ uos dot de>
pkgname=pngquant-git
pkgver=2.2.0.r26.gb848d0e
pkgrel=1
pkgdesc="pngquant is a command-line utility to quantize PNGs down to 8-bit paletted PNGs"
arch=('i686' 'x86_64')
url="http://pngquant.org/"
license=('BSD')
depends=('libpng' 'zlib')
makedepends=('git')
source=()
md5sums=()

provides=('pngquant')
conflicts=('pngquant')
replaces=()

source=("$pkgname"::'git://github.com/pornel/improved-pngquant.git')
md5sums=('SKIP')

_LDFLAGS="-L../libpng -L../zlib -L/usr/local/lib/ -L/usr/lib/ -L/usr/X11/lib/"

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  unset CFLAGS
  LDFLAGS="$_LDFLAGS" make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  unset CFLAGS
  make PREFIX="/usr" DESTDIR="$pkgdir" BINPREFIX="$pkgdir/usr/bin" install
}
