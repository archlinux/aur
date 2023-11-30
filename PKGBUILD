# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-git
pkgver=r437.72d75d0
pkgrel=1
pkgdesc='A shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder"
license=('GPL3')
depends=('ffmpeg' 'libglvnd' 'libxcomposite' 'libxrandr' 'libx11' 'libpulse' 'libva' 'libdrm' 'libcap' 'wayland')
optdepends=(
    'nvidia-utils: Required to record your screen on NVIDIA'
    'libxnvctrl: Required when using the -oc option to overclock the NVIDIA GPU to workaround NVIDIA p2 state bug'
    'mesa: Required to record your screen on AMD/Intel'
    'libva-mesa-driver: Required to record your screen on AMD'
    'libva-intel-driver: Required to record your screen on Intel G45 and HD Graphics family'
    'intel-media-driver: Required to record your screen on Intel Broadwell+ iGPUs'
)
provides=('gpu-screen-recorder')
conflicts=('gpu-screen-recorder')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder.git.${pkgver}.tar.gz")
sha512sums=('a8b7df73c6888f655932320e8baa3032b5f698f8c73b9f24aac98074be7ab2baa862b12f5c694f82a1f76d40132261815fc050facc8674a663d54cd44ef3a93f')
install="${pkgname}.install" # setcap cap_sys_admin (gsr-kms-server), setcap cap_sys_nice (gpu-screen-recorder)

build() {
  cd "$srcdir"
  ./build.sh
}

package() {
  cd "$srcdir"
  strip "gsr-kms-server"
  strip "gpu-screen-recorder"
  install -Dm755 "gsr-kms-server" "$pkgdir/usr/bin/gsr-kms-server"
  install -Dm755 "gpu-screen-recorder" "$pkgdir/usr/bin/gpu-screen-recorder"
  install -Dm644 "extra/gpu-screen-recorder.service" "$pkgdir/usr/lib/systemd/user/gpu-screen-recorder.service"
}
