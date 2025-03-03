# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ignition-startup
_pkgname=ignition
pkgver=1.1.2
pkgrel=1
pkgdesc="Manage startup apps and scripts"
arch=('any')
url="https://github.com/flattool/ignition/"
license=('GPL-3.0-or-later')
depends=(
  'gjs'
  'libadwaita'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
source=("${_pkgname}-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('77ec958de6d6ea40875edac69b3885e3ff51c717c8d22fb34ba3f5d251c53ee2')

build() {
  arch-meson "${_pkgname}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s /usr/bin/io.github.flattool.Ignition "$pkgdir/usr/bin/${_pkgname}"
}
