# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgbase=sweep-sdk-git
pkgname=(libsweep-git)
pkgver=r115.b554b56
pkgrel=1
pkgdesc="Scanse Sweep LiDAR SDK"
url="https://github.com/scanse/sweep-sdk"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake')
source=('sweep-sdk::git://github.com/scanse/sweep-sdk.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgbase%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgbase%-git}/libsweep"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr
  cmake --build .
}

package_libsweep-git() {
  cd "$srcdir/${pkgbase%-git}/libsweep/build"
  DESTDIR="${pkgdir}" cmake --build . --target install
  install -Dm644 ../../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
