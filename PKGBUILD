# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Thomas Haider <t.haider@deprecate.de>

pkgname=python2-xlib-svn
pkgver=0.15rc1.r171
pkgrel=1
pkgdesc="A fully functional X client library for Python programs (development version)"
arch=("any")
url="http://python-xlib.sourceforge.net/"
license=('GPL')
depends=('python2' 'libx11')
makedepends=('subversion')
provides=('python2-xlib')
conflicts=('python2-xlib')
source=($pkgname::"svn+https://svn.code.sf.net/p/python-xlib/code/trunk")
md5sums=('SKIP')

pkgver() {
  cd $pkgname

  # get the version directly from package 
  local _ver=$(python2 -ESc "import Xlib; print Xlib.__version_string__")
  local _rev=$(svnversion | tr -d [A-z])
  printf "%s.r%s" "$_ver" "$_rev" 
}

build() {
  cd $pkgname

  python2 setup.py build
}

package() {
  cd $pkgname

  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
