# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-git
pkgver=r457.77e0c6d
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
sha512sums=('862825e325d837830dfda9af8911f0ba9d524f841b416cecbc09c34e87992ba725d854b6f8f6ee6170fc7891b3300481dc1703d38c6aaa3b8a65da37c5464719')
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
