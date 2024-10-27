# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-ui
pkgver=r74.c6b5ff0
pkgrel=1
pkgdesc='A fullscreen overlay UI for GPU Screen Recorder in the style of ShadowPlay. X11 only.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-ui"
license=('GPL-3.0-only')
makedepends=('meson')
depends=('libglvnd' 'libx11' 'libxrandr' 'libxrender' 'libxfixes')
provides=('gsr-ui')
conflicts=('gsr-ui')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-ui.git.${pkgver}.tar.gz")
sha512sums=('1c84add0c72c038893105062b1ec913d02a270e13a6f256cbf9f7ba645bda6286b301119dcace9990f80c906444e0104aa6a1ad822d59a58d8af0753e54a1bb6')

build() {
  cd "$srcdir"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}

post_install() {
    echo "You can start the overlay UI at system startup by running 'systemctl enable --now --user gpu-screen-recorder-ui'"
}
