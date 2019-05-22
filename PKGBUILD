# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hicolor-icon-theme-git
pkgver=0.17.r0.gf522d9d
pkgrel=2
pkgdesc="Freedesktop.org Hicolor icon theme"
arch=('any')
url="https://www.freedesktop.org/wiki/Software/icon-theme/"
license=('GPL')
makedepends=('git')
provides=('hicolor-icon-theme')
conflicts=('hicolor-icon-theme')
source=("git+https://gitlab.freedesktop.org/xdg/default-icon-theme")
sha256sums=('SKIP')


pkgver() {
  cd "default-icon-theme"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "default-icon-theme"

  ./autogen.sh --no-configure
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "default-icon-theme"

  make DESTDIR="$pkgdir" install
}
