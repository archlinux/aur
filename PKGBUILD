# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=hyprmod
pkgver=0.1.0
pkgrel=1
pkgdesc="Native GTK4/libadwaita settings app for Hyprland"
arch=('x86_64')
url="https://github.com/BlueManCZ/hyprmod"
license=('GPL-3.0-only')
depends=(
  'python'
  'gtk4'
  'libadwaita'
  'python-gobject'
  'python-hyprland-config'
  'python-hyprland-monitors'
  'python-hyprland-schema'
  'python-hyprland-socket'
  'python-hyprland-state'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-wheel'
)
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BlueManCZ/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -Dm644 data/applications/io.github.bluemancz.hyprmod.desktop \
    "${pkgdir}/usr/share/applications/io.github.bluemancz.hyprmod.desktop"
  install -Dm644 data/icons/hicolor/scalable/apps/io.github.bluemancz.hyprmod.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.bluemancz.hyprmod.svg"
  install -Dm644 data/metainfo/io.github.bluemancz.hyprmod.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/io.github.bluemancz.hyprmod.metainfo.xml"
}
