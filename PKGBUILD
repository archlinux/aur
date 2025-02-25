# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>

pkgname=high-tide
pkgver=r239.d0531d8
pkgrel=1
pkgdesc="Linux client for TIDAL streaming service"
url="https://github.com/Nokse22/high-tide"
arch=(any)
license=(GPL-3.0-or-later)
depends=(
  dconf
  glib2
  gstreamer
  gtk4
  hicolor-icon-theme
  libadwaita
  libsecret
  python
  python-gobject
  python-tidalapi
)
makedepends=(
  blueprint-compiler
  git
  meson
)

source=("git+https://github.com/Nokse22/high-tide.git")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs ||:
}

package() {
  meson install -C build --destdir "$pkgdir"
}
