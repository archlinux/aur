pkgname=ravi
pkgver=0.12
pkgrel=1
pkgdesc='a derivative of Lua 5.3 with limited optional static typing and LLVM and libgccjit based JIT compilers'
arch=(i686 x86_64)
url='https://github.com/dibyendumajumdar/ravi'
license=(MIT)
options=(staticlibs)
depends=(llvm)
makedepends=(cmake)
source=(ravi-$pkgver::https://github.com/dibyendumajumdar/ravi/archive/$pkgver.zip)
sha1sums=('4c78e4231cce26d8cb64e18b0748cd8c3b7da30f')

build() {
  cd ravi-$pkgver
  cmake -DLLVM_JIT=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE . 
  make 
}

check() {
  cd ravi-$pkgver
  make test
}

package() {
  cd ravi-$pkgver
  make DESTDIR="$pkgdir" install 
}
