# Maintainer: Claus Klingberg <cjk at pobox dot com>
# Contributor: ledti <antegist at gmail.com>

pkgname=bar-aint-recursive-xft-git
_pkgname=bar
pkgver=217.020a3e1
pkgrel=1
pkgdesc="A lightweight xcb based bar with ported xft support."
arch=('i686' 'x86_64')
url="https://github.com/krypt-n/bar"
license=('MIT')
depends=('libxcb' 'libxft' 'libx11')
makedepends=('git')
provides=('bar-aint-recursive')
conflicts=('bar-aint-recursive')
source=("$_pkgname::git+https://github.com/krypt-n/bar.git#branch=xft-port")
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
