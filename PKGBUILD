# Maintainer: guglovich <your@email.com>
# Created with assistance from Claude (Anthropic)

pkgname=simple-wireplumber-gui
pkgver=0.2.2
pkgrel=1
pkgdesc="Simple GTK4 GUI for managing PipeWire audio devices via WirePlumber"
arch=('any')
url="https://github.com/dyegoaurelio/simple-wireplumber-gui"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'gtk4'
  'libadwaita'
  'wireplumber'
  'python-gobject'
)
makedepends=(
  'meson'
  'ninja'
  'gettext'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dyegoaurelio/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('57d253ef8df22eee486375a8899a336dbcd9029563036da734d4aed4abe089cf68ff4e5ea0442cb470301be38c1328b56927f9846ce5a34560a49a6ac4f71550')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"

  # Fix executable permissions for the launcher script.
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
