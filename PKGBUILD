# Maintainer: keshavnrj

pkgname=worddle-git
pkgver=1.0.r38.3826592
pkgrel=1
pkgdesc="Wordle is a web-based word game developed by Josh Wardle. This wrapper written in Qt removes all bloat by NYT from the game."
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/keshavbhatt/worddle"
license=('MIT')
depends=('qt5-base' 'qt5-webengine')
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
