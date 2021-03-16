# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=kermit-git
pkgdesc="A VTE-based, simple and froggy terminal emulator (git)"
pkgver=3.3.r0.g2cad969
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

build() {
  mkdir -p "${pkgname%-git}/build"
  cd "${pkgname%-git}/build"
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname%-git}/build"
  make DESTDIR="$pkgdir" install
  install -Dm 644 "../README.md" -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "../man/${pkgname%-git}.1" -t "$pkgdir/usr/share/man/man1"
}
