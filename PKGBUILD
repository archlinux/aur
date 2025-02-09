# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder
pkgver=r963.a3b9b89
pkgrel=1
pkgdesc='A shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder"
license=('GPL-3.0-only')
makedepends=('meson' 'vulkan-headers')
depends=('ffmpeg' 'libglvnd' 'libxcomposite' 'libxrandr' 'libxfixes' 'libxdamage' 'libx11' 'libpulse' 'libva' 'libdrm' 'libcap' 'wayland' 'libpipewire' 'dbus')
optdepends=(
    'nvidia-utils: Required to record your screen on NVIDIA'
    'libxnvctrl: Required when using the -oc option to overclock the NVIDIA GPU to workaround NVIDIA p2 state bug'
    'mesa: Required to record your screen on AMD/Intel'
    'libva-mesa-driver: Required to record your screen on AMD'
    'libva-intel-driver: Required to record your screen on Intel G45 and HD Graphics family'
    'intel-media-driver: Required to record your screen on Intel Broadwell or later iGPUs'
    'linux-firmware: Required to record your screen on Intel Skylake or later iGPUs'
)
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder.git.${pkgver}.tar.gz")
sha512sums=('7b8f18c88186e0bfa968d12a7fd830a1eb1cb993b95d38b5d0610c3c7755067f10edf55b067c6665d0ae83438f3c5186e5f9c35bc2b4602a612abd4e00984e1e')
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
