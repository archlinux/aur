# Contributor: ledti <antegist at gmail.com>

pkgname=bar-aint-recursive-git
_pkgname=bar
pkgver=121.5e7b44d
pkgrel=1
pkgdesc="A lightweight xcb based bar."
arch=('i686' 'x86_64')
url="https://github.com/LemonBoy/bar"
license=('MIT')
depends=('libxcb')
makedepends=('git')
provides=('bar-aint-recursive')
conflicts=('bar-aint-recursive')
source=("$_pkgname::git+https://github.com/LemonBoy/bar.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # rename binary to avoid conflicting with 'bar' package in community:
  mv "$pkgdir/usr/bin/bar" "$pkgdir/usr/bin/bar-aint-recursive"
}
