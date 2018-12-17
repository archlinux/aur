# Maintainer: Luong The Minh Quang <luci at devel.faith>
pkgname=wavm-git
pkgdesc='WebAssembly Virtual Machine'
pkgver=r1302.3783a6d
pkgrel=1
arch=('x86_64')
url='https://github.com/WAVM/WAVM'
license=('custom')
depends=('llvm')
makedepends=('git' 'cmake' 'gcc')
source=("git+https://github.com/WAVM/WAVM/#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/WAVM"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd WAVM
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. -DWAVM_ENABLE_LTO=ON
}

build() {
  cd WAVM/build
  make
}

package() {
  cd WAVM/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
