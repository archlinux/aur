# Maintainer: Chris Simpson <csimpson.aur at gmail dot com>

pkgname=jzintv
pkgver=1.0beta4
pkgrel=1
pkgdesc="Intellivision Emulator"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://spatula-city.org/~im14u2c/intv/"
license=('GPL')
depends=('gcc-libs' 'sdl')

provides=('jzintv')
conflicts=('jzintv')

source=('http://spatula-city.org/~im14u2c/intv/dl/jzintv-1.0-beta4-src.zip')
md5sums=('f0118ff87eefab719288ba7f234170f4')

_rootdir="$pkgname-1.0-beta4"
_srcdir="$_rootdir/src"
_bindir="$_rootdir/bin"

build() {
  mkdir -p $_bindir
  cd "$_srcdir"
  sed -i '/^PROGS/,$d' {event,joy,jlp,util}/subMakefile
  make OPT_FLAGS="$CFLAGS" LFLAGS="-L../lib -lm"
}

package() {
  install -Dm755 "$_bindir/$pkgname" "${pkgdir}/usr/bin/$pkgname"
}
