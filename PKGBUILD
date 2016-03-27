# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Michael Schubert <mschu.dev at gmail>

pkgname=(python-numba-git)
pkgver=0.22.1.r772.gb2e1bb3
pkgrel=1
pkgdesc="NumPy aware dynamic Python compiler using LLVM"
url="https://github.com/numba/numba"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python-llvmlite-git' )
makedepends=('git' 'cython')
conflicts=()
replaces=()
backup=()
provides=(python-numba)
source=(git+https://github.com/numba/numba.git)
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
