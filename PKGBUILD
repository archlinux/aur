# Contributor: Lucas de Sena <lucas DOT ta23 @ gmail DOT com>
# Maintainer: Alexandre Dantas <eu @ alexdantas DOT net>
# Contributor: Shizeeg Unadequatov <shizeeque @ gmail DOT com>

pkgname=yetris-git
pkgver=20141010
pkgrel=5
pkgdesc="Customizable Tetris(tm) for the terminal - unstable development version"
arch=('x86_64' 'i686')
url="http://www.github.com/alexdantas/yetris/"
license=('GPL3')
depends=('ncurses')
makedepends=('git')
conflicts=('yetris')

source=("$pkgname::git+https://github.com/alexdantas/yetris.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
#  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  git log -1 --date=short | grep 'Date:' | sed 's|[^0-9]||g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="$pkgdir" PREFIX="/usr/local" install
}
