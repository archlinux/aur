# Maintainer:  Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>
# Contributor:  Kozec (kozec-at-kozec-dot-com)
# Contributor: TDY <tdy@gmx.com>
# Contributor: rabyte <rabyte*gmail>
# Contributor: LukenShiro <lukenshiro@ngi.it>

pkgname=python-pyfltk-svn
_fullpkgname=${pkgname%-svn}
_pkgname=${_fullpkgname#python-}
pkgver=r536
pkgrel=1
pkgdesc="A Python wrapper for the Fast Light Tool Kit library"
arch=('x86_64')
url="http://pyfltk.sourceforge.net/"
license=('LGPL')
depends=('fltk>=1.3.5' 'python>=3.7' 'glu')
makedepends=('swig>=3.0.12' 'python-setuptools' 'subversion')
provides=("${_fullpkgname}")
conflicts=("${_fullpkgname}")
source=("svn://svn.code.sf.net/p/pyfltk/code/trunk")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/trunk"
  printf "r%s" "$(svnversion | tr -d 'A-z')"
}

build() {
  cd "$srcdir/trunk/$_pkgname/python"
  python MakeSwig.py
}

package() {
  cd "$srcdir/trunk/$_pkgname/util"
  python setup.py install --root="${pkgdir}/" --optimize=1

  cd "$srcdir/trunk/$_pkgname"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
