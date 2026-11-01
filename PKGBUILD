# Maintainer: vani-tty1 <giovannirafanan609@gmail.com>
pkgname=velocity-speedtest
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple speedtest app"
arch=('x86_64' 'aarch64')
url="https://github.com/vani-tty1/velocity"
license=('GPL-3.0-or-later')
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
sha256sums=('51be188eef1a62bcb56eb9eed7c03482b45880b5d5c1286d26a9e3c913c8bac2')

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
