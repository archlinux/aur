# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-git
pkgver=r236.e301925
pkgrel=1
pkgdesc='A shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux. Currently only available for NVIDIA (on x11)'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder"
license=('GPL3')
depends=('ffmpeg' 'libglvnd' 'libxcomposite' 'libx11' 'libxnvctrl' 'libpulse' 'nvidia-utils')
provides=('gpu-screen-recorder')
conflicts=('gpu-screen-recorder')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder.git.${pkgver}.tar.gz")
sha512sums=('2014d1d1064aa64c272963967ac56b545acb14aee6e1f377a0a55cc8d9d27eee4488aec927c464a008a667c8f5d1d822ce4c6a9106118f9f708d95be1e685c7a')

build() {
  cd "$srcdir"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm755 "gpu-screen-recorder" "$pkgdir/usr/bin/gpu-screen-recorder"
  [ -f "/proc/driver/nvidia/version" ] && install -Dm644 "88-gsr-coolbits.conf" "$pkgdir/etc/X11/xorg.conf.d/88-gsr-coolbits.conf"
}
