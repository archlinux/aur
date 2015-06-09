#Maintainer: Maxim Petrov <maximpetrov [at] yahoo.com>
pkgname=hgtui-hg

_hgrepo="hgtui"
source=("hg+https://bitbucket.org/hgtui/$_hgrepo")

pkgver=378
pkgrel=2
pkgdesc="Textual user interface frontend for DSCM mercurial"
arch=('any')
url="http://code.google.com/p/hgtui/"
license=('GPL')
makedepends=('mercurial' 'gettext')
depends=('python2' 'python2-lxml' 'mercurial' 'ncurses')
provides=('hgtui')
conflicts=('hgtui')
install=

md5sums=("SKIP")

package() {
  cd "$srcdir/$_hgrepo"
  python2 setup.py install --root="${pkgdir}/"
  make -C po build
  DESTDIR=${pkgdir} make -C po install
  make -C po clean
}

pkgver() {
  cd "$srcdir/$_hgrepo"
  hg identify -n
}
