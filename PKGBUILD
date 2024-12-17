# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=minimon-applet-for-cosmic
pkgver=0.3.7
pkgrel=1
pkgdesc="A System Monitor applet for COSMIC"
arch=('x86_64' 'aarch64')
url="https://github.com/Hyperchaotic/minimon-applet"
license=('GPL-3.0-or-later')
depends=(
  'cosmic-applets'
  'fontconfig'
)
makedepends=(
  'cargo'
  'just'
)
source=("minimon-applet-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('16720c5b14971d4341996a0b89ae98b167e511d2ad8fb7d56fe174f4d1d605ae')

prepare() {
  cd "minimon-applet-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
