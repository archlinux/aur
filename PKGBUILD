# Maintainer: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Bradley Kennedy <bk@co60.ca>

pkgname=libuiohook
pkgver=1.2
pkgrel=2
pkgdesc="A multi-platform C library to provide global input/ouput hooking from userland."
arch=('i686' 'x86_64')
url="https://github.com/kwhat/libuiohook"
license=('GPL3')
groups=()
depends=("libxt" "libxtst" "libxinerama")
makedepends=("cmake") # All included in base-devel
optdepends=()
conflicts=()
source=("https://github.com/kwhat/$pkgname/archive/${pkgver}.zip")
sha256sums=('d7a537de52362d9ab60306cae7d00992cf11155d40b6bd8c6680ba0b025cdef1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build && cd build
  cmake -S .. -D BUILD_SHARED_LIBS=ON -D BUILD_DEMO=ON -DCMAKE_INSTALL_PREFIX=../dist
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  cmake --build . --parallel 2 --target install
}
