# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Seriel <seriel@fl0.co>

pkgname=urxvtconfig-git
pkgver=1.0.r9.gf5140f9
pkgrel=1
pkgdesc='A graphical user interface tool for configuration of the rxvt-unicode terminal emulator.'
arch=('x86_64')
url="https://github.com/daedreth/URXVTConfig"
license=('LGPL3')
depends=('desktop-file-utils' 'qt5-base')
optdepends=('imagemagick: needed to get colours from a file.')
makedepends=('git')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=("urxvtconfig::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-*}/source"
  qmake-qt5
  make
}

package() {
  cd "${pkgname%-*}/source"
  make INSTALL_ROOT="$pkgdir" install
}
