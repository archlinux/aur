# Maintainer: Greg Felice <greg@gregfelice.com>
pkgname=dailydriver
pkgver=0.1.0
pkgrel=1
pkgdesc="Visual keyboard shortcut configuration for GNOME"
arch=('any')
url="https://github.com/gregfelice/dailydriver"
license=('GPL-3.0-or-later')
depends=(
    'gtk4>=4.10'
    'libadwaita>=1.4'
    'python'
    'python-gobject'
    'python-pydantic'
    'python-tomli-w'
    'dconf'
)
makedepends=(
    'meson'
    'ninja'
    'python-build'
    'python-installer'
    'python-wheel'
)
optdepends=(
    'gnome-shell-extension-tiling-assistant: Tiling Assistant shortcut support'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gregfelice/dailydriver/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dbb0b3bcaf9880d3246a5abdb44e282544ded099ca8ff3e499659afa191ce173')

build() {
    cd "${pkgname}-${pkgver}"
    arch-meson . build
    meson compile -C build
}

package() {
    cd "${pkgname}-${pkgver}"
    meson install -C build --destdir "$pkgdir"
}
