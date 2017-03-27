# Maintainer: Sýlvan Heuser <sylvan.heuser@gmx.net>

pkgname=pol-git
_pkgname=pol
pkgver=r23.465d3bf
pkgrel=1
pkgdesc='Awk-like one-liners for Python'
arch=('i686' 'x86_64')
url="https://github.com/gkdr/lurch"
license=('MIT')
depends=('python2')
makedepends=('git' 'python2')
source=("$_pkgname::git+https://github.com/riolet/pol.git")
sha256sums=('SKIP')

pkgver () {
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
  make DESTDIR="$pkgdir" PREFIX='/usr' install
}

# vim:set ts=2 sw=2 et:
