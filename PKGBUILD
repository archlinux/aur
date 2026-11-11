# Maintainer: vani-tty1 <giovannirafanan609@gmail.com>
pkgname=velocity-speedtest
pkgver=0.4.0
pkgrel=1
pkgdesc="A simple speedtest app"
arch=('x86_64' 'aarch64')
url="https://github.com/vani-tty1/velocity"
license=('GPL-3.0-or-later')
options=(!debug)
depends=(
  'glib2'
  'gtk4'
  'libadwaita'
  'libepoxy'
  'libsoup3'
  'json-glib'
)
makedepends=(
  'blueprint-compiler'
  'meson'
  'ninja'
  'glib2-devel'
)

source=("velocity-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('07cd1bd2901bfa66ba3ad6308e52c1f19b6d6242da03fe051764ef322e40323b')

build() {
  cd "velocity-${pkgver}"
  arch-meson build
  meson compile -C build
}

check() {
  cd "velocity-${pkgver}"
  meson test -C build --print-errorlogs
}

package() {
  cd "velocity-${pkgver}"
  meson install -C build --destdir="${pkgdir}"
}
