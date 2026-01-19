# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-ui
pkgver=r483.e44b2ec
pkgrel=1
pkgdesc='A fullscreen overlay UI for GPU Screen Recorder in the style of ShadowPlay'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-ui"
license=('GPL-3.0-only')
makedepends=(
    'meson'
    'libcap'
    'linux-api-headers'
    'gtk-update-icon-cache'
    'desktop-file-utils'
)
depends=(
    'gpu-screen-recorder'
    'gpu-screen-recorder-notification'
    'libglvnd'
    'libx11'
    'libxrandr'
    'libxrender'
    'libxcomposite'
    'libxfixes'
    'libxext'
    'libxi'
    'libxcursor'
    'libpulse'
    'libdrm'
    'wayland'
)
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-ui.git.${pkgver}.tar.gz")
sha512sums=('a4201f185ff414e4c2645eba571d2485fe91f88e94e4a597d87b157ebcf4c7baf3839b2ee197116e34605bed1f8923b8ef789044b4b9fff0d16435911e631604')
install="${pkgname}.install"

build() {
  cd "$srcdir"
  arch-meson build --buildtype=release -Dstrip=true
  meson compile -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}
