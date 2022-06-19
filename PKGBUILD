# Maintainer: keshavnrj

pkgname=bingwall-git
pkgver=2.4.r63.0618044
pkgrel=1
pkgdesc="Bing wallpaper of the day application for Gnome desktop"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/keshavbhatt/BingWall"
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
