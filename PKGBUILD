# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ignition-startup
_pkgname=ignition
pkgver=1.1.0
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
sha256sums=('3527b2ea75ad9365a9528440c325cb34a00006cc5cc0f3d3ce5dfa84268abc65')

prepare() {
  cd "${_pkgname}-$pkgver"
}

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
