# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hicolor-icon-theme-git
pkgver=0.18.r2.gf83ba10
pkgrel=1
pkgdesc="Freedesktop.org Hicolor icon theme"
arch=('any')
url="https://www.freedesktop.org/wiki/Software/icon-theme/"
license=('GPL-2.0-or-later')
makedepends=('git' 'meson')
provides=("hicolor-icon-theme=$pkgver")
conflicts=('hicolor-icon-theme')
source=("git+https://gitlab.freedesktop.org/xdg/default-icon-theme")
sha256sums=('SKIP')


pkgver() {
  cd "default-icon-theme"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "default-icon-theme"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "default-icon-theme"

  #meson test -C "_build"
}

package() {
  cd "default-icon-theme"

  meson install -C "_build" --destdir "$pkgdir"
}
