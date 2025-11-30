# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-camera
pkgver=0.1.11
pkgrel=1
pkgdesc="Camera application for the COSMIC™ desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/FreddyFunk/cosmic-camera"
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b9fed0354134f1c7fe3a46906a060e3980a894cb336de7def23bd87cb30ffd63')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  just build-release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  just test
}

package() {
  cd "$pkgname-$pkgver"
  just rootdir="$pkgdir" install
}
