# Maintainer: Simon Kronberg <Simon.Kronberg at gmail dot com>

pkgname=lemonbar-xft-git
_pkgname=bar
pkgver=r280.0042efd
pkgrel=1
pkgdesc="A lightweight xcb based bar with ported xft support."
arch=('i686' 'x86_64')
url="https://gitlab.com/protesilaos/lemonbar-xft"
license=('MIT')
depends=('libxcb' 'libxft' 'libx11')
makedepends=('git')
provides=('bar-aint-recursive' 'lemonbar')
conflicts=('bar-aint-recursive' 'lemonbar')
source=("$_pkgname::git+https://gitlab.com/protesilaos/lemonbar-xft.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
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
