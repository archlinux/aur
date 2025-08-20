# Maintainer: Dråfølin <derg@drafolin.ch>

pkgname=high-tide
pkgver=1.0.0
pkgrel=1
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
  xdg-desktop-portal
)
optdepends=(
  'python-pypresence>=4.3.0.r27.gd6709d3: Discord Rich Presence support'
)
makedepends=(
  blueprint-compiler
  meson
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nokse22/high-tide/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d7dae672d3d4a16537ee9123d79053f55ff42f1da4678e21e246b6e9e0192aa4')
b2sums=('596ba796571a7b8b8e2772b38372eee9fdf00cce5056062fee0a9db706b56ae7175329ec6d1770322b03cbce9455df9f60af67f92e562365df081ecedb0bfee1')

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
