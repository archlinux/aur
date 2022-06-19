# Maintainer: keshavnrj

pkgname=qsnapstore-git
pkgver=1.0.r46.31f7293
pkgrel=1
pkgdesc="Qt based Graphical frontend for browsing and searching Ubuntu Snap Store"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/keshavbhatt/qsnapstore"
license=('MIT')
depends=('qt5-base')
makedepends=('git' 'qt5-base')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  printf "%s.r%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  qmake src
  make
}

package() {
  cd "${pkgname%-git}"
  make INSTALL_ROOT="${pkgdir}" install
}
