# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: Giuseppe Calà <jiveaxe@gmail.com>
pkgname=pacmanlogviewer-git
pkgver=1.4.3.r14.g6848700
pkgrel=1
pkgdesc="Inspect pacman log files"
arch=('x86_64')
url="https://www.opendesktop.org/p/1131723"
license=('GPL3')
depends=('qt6-base' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'qt6-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/gcala/pacmanlogviewer.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${pkgname%-git}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
    cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
