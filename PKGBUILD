pkgname=ravi
pkgver=0.13
pkgrel=1
pkgdesc='a derivative of Lua 5.3 with limited optional static typing and LLVM and libgccjit based JIT compilers'
arch=(i686 x86_64)
url='https://github.com/dibyendumajumdar/ravi'
license=(MIT)
options=(staticlibs)
depends=(llvm)
makedepends=(cmake)
source=(ravi-$pkgver.zip::https://github.com/dibyendumajumdar/ravi/archive/$pkgver.zip)
sha1sums=('f3a65185a7cb3030c19b9feb63d74e443e9a029a')

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
