# Maintainer: orhun <github.com/orhun>
pkgname=k3rmit-git
pkgdesc="A VTE-based terminal emulator that aims to be simple, fast and effective."
pkgver=1.8.r0.g8c4ed86
pkgrel=1
arch=('any')
url="https://github.com/orhun/k3rmit"
license=('GPL3')
depends=('gtk3>=3.18.9' 'vte3>=0.42.5')
makedepends=('cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git://github.com/orhun/k3rmit.git')
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