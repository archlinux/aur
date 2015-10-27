# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python2-polymode-git
pkgver=r27.890a1ef
pkgrel=1
pkgdesc="A python library for the modal analysis of microstructured optical fibers"
arch=('i686' 'x86_64')
url="https://code.google.com/p/polymode/"
license=('GPL3')
depends=('python2-numpy' 'python2-scipy' 'blas' 'python2-matplotlib' 'boost-libs')
makedepends=('git')
provides=('python2-polymode')
conflicts=('python2-polymode')
source=("git+https://github.com/adocherty/polymode")
_gitname="polymode"
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}
prepare() {
  cd "$srcdir"/"${_gitname}"/Polymode/mathlink/
  sed -i s+boost_python-py26+boost_python+ setup.py
  sed -i 1s+python+python2+ setup.py ../setup.py
}

build() {
  cd "$srcdir"/"$_gitname"
  CPPFLAGS+=" -fpermissive" python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir"
}
