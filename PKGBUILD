# Maintainer: Axel Parra <axel.pc@openmailbox.org>

pkgname=lemonbar-git
_pkgname=bar
pkgver=170.25c3441
pkgrel=1
pkgdesc="A featherweight, lemon-scented, bar based on xcb."
arch=('i686' 'x86_64')
url="https://github.com/LemonBoy/bar"
license=('MIT')
depends=('libxcb')
makedepends=('git')
provides=('lemonbar')
conflicts=('lemonbar-xft-git' 'bar-aint-recursive-git' 'bar-aint-recursive-xft-git')
source=("$_pkgname::git+https://github.com/Lemonboy/bar.git#branch=master")
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
}
