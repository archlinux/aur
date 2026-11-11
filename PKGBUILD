# Maintainer: ohli <olifriedrich at gmail dot com>
# Previous maintainer: MiguVT <contacto@miguvt.com>
# Previous maintainer: Dråfølin <derg@drafolin.ch>

pkgname=high-tide
pkgver=1.6.0
pkgrel=1
pkgdesc="Linux client for TIDAL streaming service"
url="https://github.com/Nokse22/high-tide"
arch=(any)
license=(GPL-3.0-or-later)
depends=(
  dconf
  glib2
  gst-plugins-base
  gst-plugins-good
  gstreamer
  gtk4
  hicolor-icon-theme
  libadwaita
  libportal
  libsecret
  org.freedesktop.secrets
  python
  python-gobject
  python-pypresence
  python-requests
  'python-tidalapi>=0.8.6'
  python-urllib3
  xdg-desktop-portal
)
optdepends=(
  'alsa-utils: Advanced details in ALSA device picker'
)
makedepends=(
  blueprint-compiler
  meson
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nokse22/high-tide/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c1b547c3430a3d1d9996a2c7eacb1f2932ee1a09ba35a781d9ac0255e9c0b810')
b2sums=('4b626a65e9906eabd69e3085ccef4317a02da1628f2847fc32f693792d4895fcef25f49349f45d80150dfed61a2b7275045121db0de5ad0d95eeeeb8797a1ef9')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
