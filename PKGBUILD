pkgname=ravi
pkgver=1.0.beta2.1.r25.gde42b8b
pkgrel=1
pkgdesc='A derivative of Lua 5.3 with limited optional static typing and LLVM and libgccjit based JIT compilers'
arch=(i686 x86_64)
url='https://github.com/dibyendumajumdar/ravi'
license=(MIT)
depends=(llvm)
makedepends=(cmake git)
source=('git+https://github.com/dibyendumajumdar/ravi.git')
sha1sums=('SKIP')

pkgver() {
  cd ravi
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
