# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-git
pkgver=r709.fbbeadf
pkgrel=1
pkgdesc='A shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder"
license=('GPL-3.0-only')
makedepends=('meson')
depends=('ffmpeg' 'libglvnd' 'libxcomposite' 'libxrandr' 'libxfixes' 'libxdamage' 'libxi' 'libx11' 'libpulse' 'libva' 'libdrm' 'libcap' 'wayland' 'libpipewire' 'dbus')
optdepends=(
    'nvidia-utils: Required to record your screen on NVIDIA'
    'libxnvctrl: Required when using the -oc option to overclock the NVIDIA GPU to workaround NVIDIA p2 state bug'
    'mesa: Required to record your screen on AMD/Intel'
    'libva-mesa-driver: Required to record your screen on AMD'
    'libva-intel-driver: Required to record your screen on Intel G45 and HD Graphics family'
    'intel-media-driver: Required to record your screen on Intel Broadwell or later iGPUs'
    'linux-firmware: Required to record your screen on Intel Skylake or later iGPUs'
)
provides=('gpu-screen-recorder')
conflicts=('gpu-screen-recorder')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder.git.${pkgver}.tar.gz")
sha512sums=('c402f05e014a44999a2cbf7155c04730abc7ff2cfc5eca782585555e1f4f53866180797a9ddc0999b3ddb3c4ad2f418707380b2da7f7fff554df45c466c1105c')
install="${pkgname}.install" # setcap cap_sys_admin (gsr-kms-server), setcap cap_sys_nice (gpu-screen-recorder)

build() {
  cd "$srcdir"
  arch-meson build -Dsystemd=true
  meson compile -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}
