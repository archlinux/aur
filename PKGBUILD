# Maintainer: Adrian Freund <freundadrian@gmail.com>
pkgname=lemonbar-ucs4-git
_pkgname=bar
pkgver=213.91b444a
pkgrel=1
pkgdesc="A lightweight xcb based bar with ported xft support."
arch=('i686' 'x86_64')
url="https://github.com/krypt-n/bar"
license=('MIT')
depends=('libxcb' 'libxft' 'libx11')
makedepends=('git')
provides=('bar-aint-recursive' 'lemonbar')
conflicts=('bar-aint-recursive' 'lemonbar')
source=("$_pkgname::git+https://github.com/krypt-n/bar.git#branch=ucs4")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
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
