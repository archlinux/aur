# Maintainer: MiguVT <contacto@miguvt.com>
# Previous maintainer: Dråfølin <derg@drafolin.ch>

pkgname=high-tide
pkgver=1.4.0
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
sha256sums=('1876cd46e0f7c0393aaf7efde0496b32165a477ea6c62a61aeb7ecff32623047')
b2sums=('e9d94ea27316421e7ecd3194ef166533f36eaf3448fc2e7e003548f0e6ad7c5252fc2ae9a13072e5f70fb1a68add46dfd240122ddf8ed9b30134a34e81f365a3')

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
