# Maintainer: Fazlul Shahriar <fshahriar@gmail.com>
#
# Repository: https://github.com/fhs/archlinux-packages
pkgname=tinyscheme
pkgver=1.41
pkgrel=1
pkgdesc="A lightweight Scheme interpreter that implements a large subset of R5RS."
arch=('i686' 'x86_64')
url="http://tinyscheme.sourceforge.net/"
license=('BSD')
depends=('glibc')
makedepends=()
source=("http://downloads.sourceforge.net/project/tinyscheme/tinyscheme/tinyscheme-$pkgver/tinyscheme-$pkgver.tar.gz")
md5sums=('2006c867b7a50e73644fabbb3bb9a21a')

build() {
  cd "$srcdir/tinyscheme-$pkgver"

  sed -i '/^# Cygwin/,$s/^\(PLATFORM_FEATURES\)/#\1/' makefile
  sed -i 's;^\(# define InitFile\).*$;\1 "/usr/lib/tinyscheme/init.scm";' scheme.c
  make all
}

package() {
  cd "$srcdir/tinyscheme-$pkgver"

  install -Dm755 scheme "$pkgdir/usr/bin/tinyscheme"
  install -Dm755 libtinyscheme.so "$pkgdir/usr/lib/libtinyscheme.so"
  install -Dm644 libtinyscheme.a "$pkgdir/usr/lib/libtinyscheme.a"
  install -Dm644 init.scm "$pkgdir/usr/lib/tinyscheme/init.scm"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/tinyscheme/COPYING"
}

# vim:set ts=2 sw=2 et:
