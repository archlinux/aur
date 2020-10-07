# Maintainer: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Bradley Kennedy <bk@co60.ca>

pkgname=libuiohook
pkgver=1.2.2
pkgrel=2
pkgdesc="A multi-platform C library to provide global input/ouput hooking from userland."
arch=('i686' 'x86_64')
url="https://github.com/kwhat/libuiohook"
license=('GPL3')
groups=()
depends=("libxt" "libxtst" "libxinerama" "libxkbcommon-x11")
makedepends=("cmake" "libxkbfile")
optdepends=()
conflicts=()
source=("https://github.com/kwhat/$pkgname/archive/${pkgver}.zip")
sha256sums=('8a199538f45889bc49a56f73a727e221f2fb7156324ab29f4dcb855f1ec80979')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir build && cd build
  cmake -S .. -D BUILD_SHARED_LIBS=ON -D CMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cd build
  DESTDIR="$pkgdir" cmake --build . --parallel 2 --target install 
}
