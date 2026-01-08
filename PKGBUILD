# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-camera
pkgver=0.1.19
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
sha256sums=('fffa870359f319bfecaa950ac94f3fadea9054a0dd398b1d34291e703f884f47')

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
