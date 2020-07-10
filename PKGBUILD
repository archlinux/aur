# Maintainer: orhun <github.com/orhun>
pkgname=kermit-git
pkgdesc="A VTE-based, simple and froggy terminal emulator (git)"
pkgver=3.0.r2.g867571f
pkgrel=1
arch=('any')
url="https://github.com/orhun/kermit"
license=('GPL3')
depends=('gtk3>=3.18.9' 'vte3>=0.42.5')
makedepends=('cmake')
conflicts=("${pkgname%-git}")
source=('git://github.com/orhun/kermit.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
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
}
