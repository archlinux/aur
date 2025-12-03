# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-camera
pkgver=0.1.16
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
sha256sums=('52d69696adb7e78c531c4add1338a82063c11e982c0d0834e7773862333c5370')

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
