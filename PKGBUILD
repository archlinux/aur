# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-git
pkgver=r237.10d7bf9
pkgrel=1
pkgdesc='A shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux. Currently only available for NVIDIA (on x11)'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder"
license=('GPL3')
depends=('ffmpeg' 'libglvnd' 'libxcomposite' 'libx11' 'libxnvctrl' 'libpulse' 'nvidia-utils')
provides=('gpu-screen-recorder')
conflicts=('gpu-screen-recorder')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder.git.${pkgver}.tar.gz")
sha512sums=('561f0f6ca53b9ba6d384149d13606f65f07594ff817549cd4a851a56f0b241af6ae0ab5227679aa3a4837fef4f14fcfb6dfcc204541bed32ebd632456d118dca')

build() {
  cd "$srcdir"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm755 "gpu-screen-recorder" "$pkgdir/usr/bin/gpu-screen-recorder"
  [ -f "/proc/driver/nvidia/version" ] && install -Dm644 "88-gsr-coolbits.conf" "$pkgdir/etc/X11/xorg.conf.d/88-gsr-coolbits.conf"
}
