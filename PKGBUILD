# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=python2-polymode-svn
pkgver=75
pkgrel=2
pkgdesc="A python library for the modal analysis of microstructured optical fibers"
arch=('i686' 'x86_64')
url="https://code.google.com/p/polymode/"
license=('GPL3')
depends=('python2-numpy' 'python2-scipy' 'atlas-lapack' 'python2-matplotlib' 'boost-libs')
makedepends=('subversion')
provides=('python2-polymode')
conflicts=('python2-polymode')
source=("polymode::svn+http://polymode.googlecode.com/svn/trunk/")
md5sums=('SKIP')
_svnmod="polymode"

pkgver() {
  cd "$srcdir"/"${_svnmod}"
  local ver="$(svnversion)"
  printf "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir"/"${_svnmod}"/Polymode/mathlink/
  sed -i s+boost_python-py26+boost_python+ setup.py
  sed -i 1s+python+python2+ setup.py ../setup.py
}

build() {
  cd "$srcdir"/"${_svnmod}"
  CPPFLAGS+=" -fpermissive" python2 setup.py build
}

package() {
  cd "$srcdir"/"${_svnmod}"
  python2 setup.py install --root="$pkgdir"
}
