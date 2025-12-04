# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-camera
pkgver=0.1.17
pkgrel=1
pkgdesc="Camera application for the COSMIC™ desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/camera"
license=('GPL-3.0-or-later')
depends=(
  'gst-plugin-pipewire'
  'gst-plugins-bad'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-ugly'
  'gstreamer'
  'libinput'
  'libxkbcommon'
  'seatd'
  'systemd-libs'
)
makedepends=(
  'cargo'
  'just'
)
source=("camera-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('96e991692dd7642db7002c23fcee0a5ae10a1e9773645f815199212558da9f0d')

prepare() {
  cd "camera-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc --print host-tuple)"
}

build() {
  cd "camera-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  just build-release
}

check() {
  cd "camera-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  just test
}

package() {
  cd "camera-$pkgver"
  just rootdir="$pkgdir" install
}
