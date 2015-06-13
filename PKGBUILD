# Contributor: andreas_baumann <abamann@yahoo.com>
# Maintainer: Daniel YC Lin <dlin.tw at gmail>

# For update to newest source
# hg clone --insecure https://hg.furius.ca/public/xxdiff

pkgname=xxdiff-hg
pkgver=448.c5de
pkgrel=1
pkgdesc="A graphical browser for file and directory differences."
url="http://furius.ca/xxdiff"
license=('GPL2')
depends=('qt4')
#makedepends=('flex>=2.5.31' 'bison27' 'mercurial' 'python-docutils')
makedepends=('flex>=2.5.31' 'bison' 'mercurial' 'python-docutils')
arch=('x86_64' 'i686')
conflicts=('xxdiff')
provides=('xxdiff')
#source=('xxdiff::hg+https://hg.furius.ca/public/xxdiff')
source=('xxdiff::hg+https://bitbucket.org/blais/xxdiff')
md5sums=(SKIP)
_repo=xxdiff

pkgver() {
  cd $_repo
  _id=$(hg identify -i)
  echo $(hg identify -n).${_id:0:4}
}
build() {
  cd "xxdiff/src"
  export QMAKE=/usr/bin/qmake-qt4
  make -f Makefile.bootstrap
  make
}

package() {
  cd "xxdiff/src"
  install -D -m 755 "$srcdir/xxdiff/bin/xxdiff" "$pkgdir/usr/bin/xxdiff"
}
# vim:et sw=2 ts=2 ai
