# Maintainer: Dråfølin <derg@drafolin.ch>

pkgname=high-tide
pkgver=0.1.8
pkgrel=2
pkgdesc="Linux client for TIDAL streaming service"
url="https://github.com/Nokse22/high-tide"
arch=(any)
license=(GPL-3.0-or-later)
depends=(
  dconf
  glib2
  gstreamer
  gst-plugins-base
  gst-plugins-good
  gtk4
  hicolor-icon-theme
  libadwaita
  libportal
  libsecret
  python
  python-gobject
  'python-tidalapi>=0.8.6'
  org.freedesktop.secrets
  "python-pypresence>=4.3.0.r27.gd6709d3"
  xdg-desktop-portal
)
optdepends=(
  # 'python-pypresence>=4.3.0.r27.gd6709d3: Discord Rich Presence support'
)
makedepends=(
  blueprint-compiler
  meson
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nokse22/high-tide/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fa6f5e17bf49150a0d6f3d281ff5edb37a1ca51fc8f33c1a9264c1e386ac0674')
b2sums=('b76c2d7b3f9d8cdc48b7d5fcd43e98e043a0640544afbabaf9377af4067b12fd99a9a30a6d7acbf64c2a52ac00880c8da11a23b4d708750da97cac80f217a3ff')

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
