# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_pkgname=gedit
pkgname="lib${_pkgname}-gtksourceview"
pkgver=299.0.3
pkgrel=1
_pkgdesc=("Library that extends GtkTextView, the standard GTK "
          "widget for multiline text editing.")
pkgdesc="${_pkgdesc[@]}"
arch=(x86_64)
url="https://github.com/${_pkgname}-technology/${pkgname}"
license=(LGPL2.1)
depends=(
  'gtk3'
  'libxml2'
)
makedepends=(
  'gobject-introspection'
  'meson'
)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=(
  '68b7825d4577cfb94bd688364cfa581e441eccd8e7f73769648be4f69ae5c06a'
)

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

check() {
  xvfb-run -s '-screen 0 1920x1080x24 -nolisten local' \
    meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
