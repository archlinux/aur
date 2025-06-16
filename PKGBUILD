# Maintainer: Dråfølin <derg@drafolin.ch>

pkgname=high-tide
pkgver=0.1.7
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
sha256sums=('edda931acf197cdaea144b68537e3bf1f5ce5b1236eb0da9930434c9977ef352')
b2sums=('31ecccfa70b7366f2c9d97ea0cf1e88c4fceae5b9c6bd587e58883696b6c38ab9d6b7cb619a5d4b5174a64d956ca840452a886ef216869cdf6fbda1c8c370ea2')

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
