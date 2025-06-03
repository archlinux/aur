# Maintainer: Dråfølin <derg@drafolin.ch>

pkgname=high-tide
pkgver=0.1.6
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
  org.freedesktop.secrets
)
optdepends=(
  "python-discord_rpc: Discord Rich Presence support"
)
makedepends=(
  blueprint-compiler
  meson
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nokse22/high-tide/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7ad88a8cd8cb7a87fbb48fa5cb2f854b3943f966a53086b7f89a4c70cda44480')
b2sums=('3a117ff8081adb5a4baf13066b8d9d4819523c22694ba6395088f4a4bd3ac2a113148cea42c768ea96596606094b7d8e9f3d4bc643bd1d7d8214a2156e73f1d7')

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
