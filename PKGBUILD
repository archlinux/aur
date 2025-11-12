# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-ui
pkgver=r442.a9a1f9d
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
sha512sums=('5e795b78bd33b321cc28983a2394ead196278e9d0f5a9d69329fe1bcf83bc6fdd66d4ee490b3746974f80fbdca909d30d147f9b53455d115a2d865c78d0bec86')
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
