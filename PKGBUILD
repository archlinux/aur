# Maintainer: dianlujitao <dianlujitao at gmail dot com>
# Contributor: Michael Schubert <mschu.dev at gmail>

_gitname=numba
pkgname=python-${_gitname}-py39-git
pkgver=0.50.0dev0.r1993.g371105627
pkgrel=1
pkgdesc="NumPy aware dynamic Python compiler using LLVM"
url="http://numba.pydata.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python-llvmlite>=0.35.0' 'python-numpy>=1.16')
makedepends=('git' 'cython')
optdepends=('python-scipy>=1.0.0')
provides=('python-numba')
conflicts=('python-numba')
source=(git+https://github.com/stuartarchibald/numba.git#branch=wip/py39_2)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
