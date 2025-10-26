# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-ui
pkgver=r422.1c24616
pkgrel=1
pkgdesc='A fullscreen overlay UI for GPU Screen Recorder in the style of ShadowPlay'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-ui"
license=('GPL-3.0-only')
makedepends=('meson' 'libcap')
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
    'linux-api-headers'
    'libpulse'
    'libdrm'
    'wayland'
)
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-ui.git.${pkgver}.tar.gz")
sha512sums=('c4ac4254d5db8cea6af066678bd262de38537b18eaa2030e36c85e0f543d2d4a38cc19d383b0abd88e0fb57721f54f8445aea7d5a98490c508868d752981865b')
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
