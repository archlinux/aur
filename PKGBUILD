# Maintainer: ohli <olifriedrich at gmail dot com>
# Previous maintainer: MiguVT <contacto@miguvt.com>
# Previous maintainer: Dråfølin <derg@drafolin.ch>

pkgname=high-tide
pkgver=1.12.0
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
sha256sums=('c2d20e516b9a6cc5b4a0bf5e6f8f352d043fd11f3216c365aa7e5f9804a69b13')
b2sums=('33b84d5b7e1d13849ee5f3cbd6c59bffc8ca60408fe90a762ea3614ad1be9aed47714e3fd1ec94dfd32c44f6b42085226a7cad324b276dc7c3f66f6135a33798')

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
