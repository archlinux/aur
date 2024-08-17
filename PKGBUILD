# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=minimon-applet-for-cosmic
pkgver=0.1.3
pkgrel=2
pkgdesc="A System Monitor applet for COSMIC"
arch=('x86_64' 'aarch64')
url="https://github.com/Hyperchaotic/minimon-applet"
license=('GPL-3.0-or-later')
depends=('cosmic-applets')
makedepends=('cargo' 'just')
source=("minimon-applet-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('918bf75e8cee1a538c5bf3f67585b63572b7f3126d0739e43d7482cd55030368')

prepare() {
  cd "minimon-applet-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "minimon-applet-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  just build-release
}

package() {
  cd "minimon-applet-$pkgver"
  just rootdir="$pkgdir" install
}
