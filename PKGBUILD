# Maintainer: Moritz Lipp <mlq@pwmt.org>

_pkgbasename=libunwind
pkgname=lib32-$_pkgbasename
pkgver=1.1
pkgrel=3
pkgdesc="Portable and efficient C programming interface (API) to determine the call-chain of a program"
arch=('x86_64')
url="http://www.nongnu.org/libunwind/"
license=('GPL')
depends=('glibc' 'libunwind')
makedepends=('texlive-core')
options=(!libtool)
provides=(lib32-libunwind)

source=(http://download.savannah.gnu.org/releases/$_pkgbasename/$_pkgbasename-$pkgver.tar.gz)
md5sums=('fb4ea2f6fbbe45bf032cd36e586883ce')

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  CFLAGS="-m32 -U_FORTIFY_SOURCE" LDFLAGS="-m32" ./configure --prefix=/usr \
    --libdir=/usr/lib32 --target=i686-pc-linux-gnu
  make
}

check() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  make check || return 0
}

package() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  make DESTDIR="$pkgdir/" install

  find $pkgdir/usr/include/*.h -not -name "*x86*" -exec rm -f {} \;
}

# vim:set ts=2 sw=2 et:
