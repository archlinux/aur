# Maintainer: Dråfølin <derg@drafolin.ch>

pkgname=high-tide
pkgver=0.1.5
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
  meson
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nokse22/high-tide/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c388370db687950fac16eea9e835cca0fa8cdb623487e74245d9ed29725152be')
b2sums=('e7e44bca1c562d778892f228ca7b719154203a37ae722030905e3a7535fdef437c8076c8b3142995a6664289b6df3298f8ba10b4e0755e6ae63381380d036dbc')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs ||:
}

package() {
  meson install -C build --destdir "$pkgdir"
}
