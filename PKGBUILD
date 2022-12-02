# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=kermit-git
pkgdesc="A VTE-based, simple and froggy terminal emulator (git)"
pkgver=3.8.r0.gdb42b6e
pkgrel=1
arch=('x86_64')
url="https://github.com/orhun/kermit"
license=('GPL3')
depends=('gtk3>=3.18.9' 'vte3>=0.42.5')
makedepends=('git' 'cmake')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  mkdir -p build
}

build() {
  cd "${pkgname%-git}/build"
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname%-git}/build"
  make DESTDIR="$pkgdir" install
  install -Dm 644 "../.config/${pkgname%-git}.conf" -t "$pkgdir/usr/share/${pkgname%-git}/examples"
}
