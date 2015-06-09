# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=bmap-tools
pkgver=3.2
_relcommit=96702a869220ab20830db916ec4ac595e1d97f92
pkgrel=1
pkgdesc="Tool optimized for copying largely sparse files using information from a block map (bmap) file"
arch=(any)
url="http://git.infradead.org/users/dedekind/bmap-tools.git"
license=('GPL2')
depends=('python2')
makedepends=('git' 'python2-setuptools')
source=(git://git.infradead.org/users/dedekind/bmap-tools.git)
sha256sums=('SKIP')

pkgver() {
  cd bmap-tools/
  git checkout $_relcommit
  awk '/^VERSION =/ { print $3 }' bmaptool | sed 's/"\(.*\)"/\1/'
}

build() {
  cd bmap-tools/
  git checkout $_relcommit
  python2 setup.py build
}

package() {
  cd bmap-tools/
  python2 setup.py install --root=$pkgdir/ --optimize=1
  install -Dm644 docs/man1/bmaptool.1 "$pkgdir"/usr/share/man/man1/bmaptool.1
} 

# vim:set ts=2 sw=2 et:
