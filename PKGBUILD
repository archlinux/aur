# Maintainer: Dråfølin <derg@drafolin.ch>

pkgname=high-tide
pkgver=1.2.0
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
  'alsa-utils: Advanced details in ALSA device picker'
)
makedepends=(
  blueprint-compiler
  meson
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nokse22/high-tide/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4eebcb0265963bea4aa336f7319a9e029d7f763edb5b28c28449c6339987f679')
b2sums=('41c2c8b0c566057f2c6fa8371fade76b820aacb59e11eff14a9e72e7cdbf496c606576c2aa5dc13299d60bddcdcf6555af7646aea99bdb0659defd0dfa6076bc')

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
