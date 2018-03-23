# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-llvmlite
pkgver=0.22.0
pkgrel=2
pkgdesc="Lightweight LLVM python binding for writing JIT compilers"
url="https://github.com/numba/llvmlite"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2' 'llvm50-libs')
makedepends=('cython2' 'llvm50')
source=("https://github.com/numba/llvmlite/archive/v$pkgver.tar.gz")
md5sums=('c5641a032d87bfdea113060e20bf2513')

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
