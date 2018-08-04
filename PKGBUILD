# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-llvmlite
pkgver=0.24.0
pkgrel=1
pkgdesc="Lightweight LLVM python binding for writing JIT compilers"
url="https://github.com/numba/llvmlite"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2-enum34' 'llvm>=6.0.0' 'llvm<6.1.0' 'llvm-libs')
makedepends=('cython2' 'llvm')
source=("https://github.com/numba/llvmlite/archive/v$pkgver.tar.gz")
sha256sums=('456b9d9f6329e578b2f10db16067db6eab0efb296b8381a95b2285c394fa3173')

build() {
  cd "$srcdir/llvmlite-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/llvmlite-$pkgver"
  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1

  pydir=$(python2 -c "from distutils.sysconfig import get_python_lib; \
    print get_python_lib()")
  install -m755 "$srcdir"/llvmlite-$pkgver/ffi/libllvmlite.so \
    "$pkgdir/$pydir"/llvmlite/binding
}
