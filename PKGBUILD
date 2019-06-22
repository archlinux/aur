pkgname=ravi
pkgver=1.0.beta1
pkgrel=1
pkgdesc='A derivative of Lua 5.3 with limited optional static typing and LLVM and libgccjit based JIT compilers'
arch=(i686 x86_64)
url='https://github.com/dibyendumajumdar/ravi'
license=(MIT)
depends=(llvm6)
makedepends=(cmake git)
source=('git+https://github.com/dibyendumajumdar/ravi.git#commit=8cafee076256319ec636bd131d53cc93c1f62bcc')
sha1sums=('SKIP')

build() {
  cd ravi
  #sed -i 's/~\/Software\/omr\/include\/nj/\/usr\/include\/nj/' cmake/FindOMRJIT.cmake
  cmake -DLLVM_JIT=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE .
  make
}

check() {
  cd ravi
  make test
}

package() {
  cd ravi
  make DESTDIR="$pkgdir" install
}
