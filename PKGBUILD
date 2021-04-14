# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>
# Contributor: M Buschsieweke

pkgname=tinyscheme
pkgver=1.42
pkgrel=1
pkgdesc="A lightweight Scheme interpreter that implements a large subset of R5RS."
arch=('i686' 'x86_64')
url="http://tinyscheme.sourceforge.net/"
license=('BSD')
depends=('glibc')
makedepends=()
options=('staticlibs')
source=("http://downloads.sourceforge.net/project/tinyscheme/tinyscheme/tinyscheme-$pkgver/tinyscheme-$pkgver.tar.gz")
md5sums=('273ac5ffe5305986b329e9045f2aea89')

prepare() {
  cd "$srcdir/tinyscheme-$pkgver"

  sed -i '/^# Cygwin/,$s/^\(PLATFORM_FEATURES\)/#\1/' makefile
  sed -i 's;^\(# define InitFile\).*$;\1 "/usr/lib/tinyscheme/init.scm";' scheme.c
}

build() {
  cd "$srcdir/tinyscheme-$pkgver"

  make all
}

package() {
  cd "$srcdir/tinyscheme-$pkgver"

  install -Dm755 scheme "$pkgdir/usr/bin/tinyscheme"
  install -Dm755 libtinyscheme.so "$pkgdir/usr/lib/libtinyscheme.so"
  install -Dm644 libtinyscheme.a "$pkgdir/usr/lib/libtinyscheme.a"
  install -Dm644 init.scm "$pkgdir/usr/lib/tinyscheme/init.scm"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/tinyscheme/COPYING"
  install -Dm644 -t "$pkgdir/usr/include/tinyscheme" scheme.h dynload.h \
                    scheme-private.h opdefines.h
}

# vim:set ts=2 sw=2 et:
