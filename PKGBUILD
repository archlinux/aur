# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-llvmlite
pkgver=0.11.0
pkgrel=1
pkgdesc="Lightweight LLVM python binding for writing JIT compilers"
url="http://numba.pydata.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2-enum34' 'llvm>=3.7.0' 'llvm<3.8.0')
makedepends=('cython2')
source=("https://github.com/numba/llvmlite/archive/v$pkgver.tar.gz")
md5sums=('7776f74e65eaa297eef8c5736ba23b21')

build() {
  cd "$srcdir/llvmlite-$pkgver"
  sed -i "s/-lLLVMOProfileJIT//" ffi/Makefile.linux
  python2 setup.py build
}

package() {
  cd "$srcdir/llvmlite-$pkgver"
  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
