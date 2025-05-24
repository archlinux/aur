# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=minimon-applet-for-cosmic
pkgver=0.5.2
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
source=("minimon-applet-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8db63b51529b7a9fd4ca64a259cf534b9cddcdc9cea06fb58a4b4dfc0759ffe1')

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
