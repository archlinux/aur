# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Michael Schubert <mschu.dev at gmail>

pkgname=(python-numba-git)
_gitname=numba
pkgver=0.22.1.r574.g77d6a60
pkgrel=1
pkgdesc="A lightweight LLVM python binding for writing JIT compilers"
url="https://github.com/numba/numba"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python' 'python-llvmlite-git' )
makedepends=('git' 'cython')
conflicts=()
replaces=()
backup=()
provides=(python-numba)
source=(${_gitname}::git+https://github.com/numba/numba.git)
md5sums=('SKIP')


pkgver() {
  cd numba
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/numba"
  python setup.py build
}

package() {
  cd "$srcdir/numba"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
