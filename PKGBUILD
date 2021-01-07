pkgname=ravi
pkgver=1.0.beta5
pkgrel=1
pkgdesc='A derivative of Lua 5.3 with limited optional static typing and LLVM and libgccjit based JIT compilers'
arch=(i686 x86_64)
url='https://github.com/dibyendumajumdar/ravi'
license=(MIT)
makedepends=(cmake git)
source=('git+https://github.com/dibyendumajumdar/ravi.git#tag=1.0-beta5')
sha1sums=('SKIP')

pkgver() {
  cd ravi
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ravi
  sed -i 's/usr\/local/usr/' include/luaconf.h
}

build() {
  cd ravi
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE .
  make
}

package() {
  cd ravi
  make DESTDIR="$pkgdir" install
}
