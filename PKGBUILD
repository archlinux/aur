# Maintainer: Connor Behan <connor.behan@gmail.com>

pkgname=python2-symengine-git
pkgver=r464.9d23ef7
pkgrel=1
pkgdesc="Python bindings for symengine"
url="http://sympy.org/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('symengine-git' 'python2')
makedepends=('cmake' 'git' 'cython2' 'python2-setuptools')
source=(git+https://github.com/symengine/symengine.py.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/symengine.py"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/symengine.py"
  python2 setup.py build --define="PYTHON_BIN=python2;CYTHON_BIN=cython2"
}

package() {
  cd "$srcdir/symengine.py"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
