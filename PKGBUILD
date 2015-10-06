# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=coz-git
pkgver=r239.935fc29
pkgrel=1
pkgdesc="a new kind of profiler that measures optimization potential"
arch=('x86_64')
url="https://github.com/plasma-umass/coz"
license=('GPL2')
depends=('python' 'clang>=3.1')
makedepends=('git')
options=()
install=
source=('coz-git::git+https://github.com/plasma-umass/coz.git'
  'python2.patch' 'no-force-preload.patch' 'tput.patch')
md5sums=('SKIP'
         'f3ff4dcc098eb00e949b362594918517'
         'b7926ac1504babe0b2551983d2d5ed25'
         'e14ecdc19cbf244388d6af0a55046083')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -Np1 < "$srcdir/python2.patch"
  patch -Np1 < "$srcdir/no-force-preload.patch"
  patch -Np1 < "$srcdir/tput.patch"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$srcdir/$pkgname/coz" "$pkgdir/usr/bin/coz"
  install -Dm644 "$srcdir/$pkgname/libcoz/libcoz.so" "$pkgdir/usr/lib/libcoz.so"
  install -Dm644 "$srcdir/$pkgname/include/coz.h" "$pkgdir/usr/include/coz.h"
}

# vim:set ts=2 sw=2 et:
