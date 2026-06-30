# Maintainer: MiguVT <contacto@miguvt.com>
# Previous maintainer: Dråfølin <derg@drafolin.ch>

pkgname=high-tide
pkgver=1.5.0
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
  python-pypresence
)
optdepends=(
  'alsa-utils: Advanced details in ALSA device picker'
)
makedepends=(
  blueprint-compiler
  meson
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nokse22/high-tide/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0fcc6d192bc24b2e9c22d74d35cb244ee7f003b9de1b9ca29b945dbff2f58a69')
b2sums=('09f3209c7f33c2753705445f23d7a1dda5aab29600b9ece0542c0ca1a6fb434ed5ebb34711c3c9b951f585b3e296f8f829144906f30679feed196b862a488207')

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
