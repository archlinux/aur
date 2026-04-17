# Maintainer: MiguVT <contacto@miguvt.com>
# Previous maintainer: Dråfølin <derg@drafolin.ch>

pkgname=high-tide
pkgver=1.3.1
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
sha256sums=('04c0657fbba4f65897b5950e1a19b7ae0c4513f6f2c702587286b50f996a5c82')
b2sums=('c8f868337f1751e7813e8fb0de83110bb5037e155b4cfc227d542ffc9fb6299c283a1abca2ea601e6e15ae22e8b2ec8b25a018a95516d8306c59428db483431a')

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
