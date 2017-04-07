# Maintainer: Vincent Hourdin <aur at vinvin dot tf>
pkgname=ser-player
pkgver=v1.6.0.r36.gfef5030
pkgrel=1
pkgdesc="A simple SER files player, a file format used in astronomy."
url="https://github.com/cgarry/ser-player"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('qt5-base')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("git+https://github.com/cgarry/ser-player.git" "AppImage.patch")
sha1sums=('SKIP' '73f2645bd9d5534a7d03b8f2222f3a69f54109fb')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  patch -p0 < ../AppImage.patch
  qmake-qt5 ser-player.pro
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 bin/ser-player "$pkgdir/usr/bin/ser_player"
}

# vim:set ts=2 sw=2 et:
