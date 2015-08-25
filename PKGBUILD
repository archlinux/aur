# Maintainer: Joris Steyn <jorissteyn@gmail.com>
# Contributor: TDY <tdy@gmx.com>
pkgname=iozone
pkgver=3_420
pkgrel=1
pkgdesc="A filesystem benchmark tool"
arch=('i686' 'x86_64' 'ppc' 'armv6h' 'armv7h')
url="http://www.iozone.org/"
license=('custom')
depends=('sh')
optdepends=('gnuplot: for generating graph reports')
install=$pkgname.install
source=(http://www.$pkgname.org/src/current/$pkgname$pkgver.tar
        $pkgname-$pkgver.diff)
md5sums=('5205cd571c6e68440772f7e0af0712d6'
         'a8fcaa9f51095d4c65bddcf7f4ed7cd8')

build() {
  cd "$srcdir/$pkgname$pkgver/src/current"
  patch -Np2 -i "$srcdir/$pkgname-$pkgver.diff"

  if test "$CARCH" == 'armv6h' || \
     test "$CARCH" == 'armv7h' ; then
    maketarget=linux-arm
  else
    maketarget=linux-$CARCH
  fi
  make $maketarget CFLAGS="$CFLAGS"
}

package() {
  cd "$srcdir/$pkgname$pkgver/src/current"
  make DESTDIR="$pkgdir" install
}
