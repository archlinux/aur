# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-git
pkgver=r313.ba86d20
pkgrel=1
pkgdesc='A shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder"
license=('GPL3')
depends=('ffmpeg' 'libglvnd' 'libxcomposite' 'libxrandr' 'libxfixes' 'libx11' 'libpulse' 'libva' 'libdrm' 'libcap')
optdepends=(
    'nvidia-utils: Required to record your screen on NVIDIA'
    'libxnvctrl: Required when using the -oc option to overclock the NVIDIA GPU to workaround NVIDIA p2 state bug'
    'mesa: Required to record your screen on AMD/Intel'
    'libva-mesa-driver: Required to record your screen on AMD'
    'libva-intel-driver: Required to record your screen on Intel G45 and HD Graphics family'
    'intel-media-driver: Required to record your screen on Intel Broadwell+ iGPUs'
    'polkit: Required to record your screen on AMD/Intel (kms grab requires root access)'
)
provides=('gpu-screen-recorder')
conflicts=('gpu-screen-recorder')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder.git.${pkgver}.tar.gz")
sha512sums=('5c11fe0cf446c9c92408d66c182fe789a1bffdf59d782a17e17ff9b2929e5cd35d6719d8b5625abfb5e867afcb8fb753c9278db591ec0fdfca413d8f1e6a7bf8')

build() {
  cd "$srcdir"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm755 "gsr-kms-server" "$pkgdir/usr/bin/gsr-kms-server"
  install -Dm755 "gpu-screen-recorder" "$pkgdir/usr/bin/gpu-screen-recorder"
  if [ -f "/proc/driver/nvidia/version" ]; then
      install -Dm644 "88-gsr-coolbits.conf" "$pkgdir/etc/X11/xorg.conf.d/88-gsr-coolbits.conf"
  fi
}
