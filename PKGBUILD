# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: Giuseppe Calà <jiveaxe@gmail.com>
pkgname=pacmanlogviewer-git
pkgver=1.4.3.r0.g542e5e0
pkgrel=1
pkgdesc="Inspect pacman log files"
arch=('x86_64')
url="https://www.opendesktop.org/p/1131723"
license=('GPL')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/gcala/pacmanlogviewer.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  cmake -S . \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DBUILD_WITH_QT5='ON' \
    -Wno-dev
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}
