# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=coz-git
pkgver=r258.11e868e
pkgrel=1
pkgdesc="a new kind of profiler that measures optimization potential"
arch=('x86_64')
url="https://github.com/plasma-umass/coz"
license=('BSD')
depends=('python' 'clang>=3.1')
makedepends=('git')
options=()
install=
source=('coz-git::git+https://github.com/plasma-umass/coz.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
}

build() {
  cd "$srcdir/$pkgname"
  make -C libcoz
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$srcdir/$pkgname/coz" "$pkgdir/usr/share/coz/coz"
  install -d "$pkgdir/usr/bin"
  ln -sfn "/usr/share/coz/coz" "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/$pkgname/libcoz/libcoz.so" "$pkgdir/usr/share/coz/libcoz/libcoz.so"
  install -Dm644 "$srcdir/$pkgname/include/coz.h" "$pkgdir/usr/include/coz.h"
}

# vim:set ts=2 sw=2 et:
