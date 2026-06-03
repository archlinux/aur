# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=minimon-applet-for-cosmic
pkgver=1.1.1
pkgrel=1
pkgdesc="A System Monitor applet for COSMIC"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/minimon-applet"
license=('GPL-3.0-or-later')
depends=('cosmic-applets')
makedepends=(
  'cargo'
  'just'
)
provides=('cosmic-ext-applet-minimon')
source=("minimon-applet-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('70ec914edbc37ae561fa8b9ee0e7bab587e332404707980b0673e51002b0dd2c')

prepare() {
  cd "minimon-applet-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "minimon-applet-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd "minimon-applet-$pkgver"
  just rootdir="$pkgdir" install
}
