pkgname=ravi
pkgver=1.0.beta2
pkgrel=1
pkgdesc='A derivative of Lua 5.3 with limited optional static typing and LLVM and libgccjit based JIT compilers'
arch=(i686 x86_64)
url='https://github.com/dibyendumajumdar/ravi'
license=(MIT)
depends=(llvm)
makedepends=(cmake git)
source=('git+https://github.com/dibyendumajumdar/ravi.git#commit=5b15a2ffceb4478db1181ab195418f3e022bbf83')
sha1sums=('SKIP')

build() {
  cd ravi
  #sed -i 's/~\/Software\/omr\/include\/nj/\/usr\/include\/nj/' cmake/FindOMRJIT.cmake
  #cmake -DOMR_JIT=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE .
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
