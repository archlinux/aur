# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder
pkgver=r1287.57caf13
pkgrel=1
pkgdesc='A shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder"
license=('GPL-3.0-only')
makedepends=(
    'meson'
    'vulkan-headers'
)
depends=(
    'ffmpeg'
    'libglvnd'
    'libxcomposite'
    'libxrandr'
    'libxfixes'
    'libxdamage'
    'libx11'
    'libpulse'
    'libva'
    'libdrm'
    'libcap'
    'wayland'
    'libpipewire'
    'dbus'
    'libjpeg-turbo'
)
optdepends=(
    'nvidia-utils: Required to record your screen on NVIDIA'
    'libxnvctrl: Required when using the -oc option to overclock the NVIDIA GPU to workaround NVIDIA p2 state bug'
    'mesa: Required to record your screen on AMD/Intel'
    'libva-mesa-driver: Required to record your screen on AMD'
    'libva-intel-driver: Required to record your screen on Intel G45 and HD Graphics family'
    'intel-media-driver: Required to record your screen on Intel Broadwell or later iGPUs or Intel Arc'
    'linux-firmware-intel: Required to record your screen on Intel Skylake or later iGPUs'
)
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder.git.${pkgver}.tar.gz")
sha512sums=('39bae5575b0c39ca77cfb1c6467d498ac6b1f5ef0c74761817afa1c159a60eb536527a769c49dd0d31bf260757308899cb3889fd6d4b449d85e5c1a2c868b890')
install="${pkgname}.install" # setcap cap_sys_admin (gsr-kms-server)

build() {
  cd "$srcdir"
  arch-meson build -Dsystemd=true --buildtype=release -Dstrip=true
  meson compile -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}
