# Maintainer: Alain Kalker <a {dot} c {dot} kalker "at" gmail {dot} com>
pkgname=python2-imusim-git
pkgver=0.2.r10.85892e2
pkgrel=1
pkgdesc="Simulator for inertial and magnetic sensing systems and algorithms"
arch=('i686' 'x86_64')
#url="http://www.imusim.org/" # Currently down
url="https://github.com/martinling/imusim"
license=('GPL3')
depends=('python2-numpy' 'python2-scipy' 'python2-matplotlib' 'mayavi')
makedepends=('python2-setuptools' 'cython')
options=(!emptydirs)
source=('git+https://github.com/martinling/imusim.git')
md5sums=('SKIP')
_gitname=imusim

pkgver() {
  cd "$srcdir/$_gitname"
  printf "%s.r%s.%s" "$(python2 setup.py --version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  # From Makefile, c target
  cython2 `find . -name \*.pyx`
  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
