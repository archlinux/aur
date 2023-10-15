# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-git
pkgver=r393.ee5d1d7
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
sha512sums=('c0e362d242a971151f8fd018e65e48ea110893c60b9c476cb6d395dd10177062c85b43d2bfc2574fff408e9ba30546cc44e990b2ab899ac1d1ac6b95e1b9df3d')
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
