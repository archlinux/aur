# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-llvmlite
pkgver=0.15.0
pkgrel=1
pkgdesc="Lightweight LLVM python binding for writing JIT compilers"
url="https://github.com/numba/llvmlite"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2-enum34' 'llvm>=3.8.0' 'llvm<3.9.0')
makedepends=('cython2')
source=("https://github.com/numba/llvmlite/archive/v$pkgver.tar.gz")
md5sums=('e14b0fec5b3c1b3eda2779b41fcf125d')

build() {
  cd "$srcdir/llvmlite-$pkgver"
  sed -i "s/-lLLVMOProfileJIT//" ffi/Makefile.linux
  python2 setup.py build
}

package() {
  cd "$srcdir/llvmlite-$pkgver"
  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
