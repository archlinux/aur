# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=minimon-applet-for-cosmic
pkgver=0.1.1
pkgrel=1
pkgdesc="A System Monitor applet for COSMIC"
arch=('x86_64' 'aarch64')
url="https://github.com/Hyperchaotic/minimon-applet"
license=('GPL-3.0-or-later')
depends=('cosmic-applets')
makedepends=('cargo' 'just')
source=("minimon-applet-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1b3ddeedfda7270322da490dc8d99ada1a669a8fb11c26ebc4275978f36f6d94')

prepare() {
  cd "minimon-applet-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "minimon-applet-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  just build-release
}

package() {
  cd "minimon-applet-$pkgver"
  just rootdir="$pkgdir" install
}
