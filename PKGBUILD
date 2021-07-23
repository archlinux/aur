# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk-git
pkgver=r17.80de59b
pkgrel=2
pkgdesc='Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL3')
makedepends=('sibs')
depends=('gtk3' 'libx11' 'libxrandr' 'libpulse' 'gpu-screen-recorder' 'ffmpeg')
provides=('gpu-screen-recorder-gtk')
conflicts=('gpu-screen-recorder-gtk')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-gtk.git.r17.80de59b.tar.gz")
sha512sums=('7e1357df71960ee2973bc058b3eeb34e133b0fd302f389192346eedd279e40c611d483e7d847289f19b7ed68ad8adf19393fba523a6b15683504f466363dff61')

build() {
  cd "$srcdir"
  sibs build --release
}

package() {
  cd "$srcdir"
  install -Dm755 "sibs-build/$(sibs platform)/release/gpu-screen-recorder-gtk" "$pkgdir/usr/bin/gpu-screen-recorder-gtk"
  install -Dm644 "gpu-screen-recorder-gtk.desktop" "$pkgdir/usr/share/applications/gpu-screen-recorder-gtk.desktop"
  echo "Optional: Install NVENC patch and NvFBC patch from https://github.com/keylase/nvidia-patch to be able to record a monitor"
}
