# Maintainer: Romain Chardiny <romain.chardiny@gmail.com>
pkgname=pestfmt
pkgver=0.2.5
pkgrel=1
pkgdesc="Tool to format Pest grammar files"
arch=("any")
url="https://github.com/pest-parser/pest-fmt"
license=('MPL-2.0')
depends=("gcc-libs")
makedepends=('rust')
source=(https://github.com/pest-parser/pest-fmt/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('df925fc8fb43c75e385169d49db93199606b9777464d474cf07c45af99194382')

prepare() {
  cd "$srcdir/pest-fmt-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/pest-fmt-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --offline
}

package() {
  cd "$srcdir/pest-fmt-${pkgver}"

  install -Dm755 target/release/pestfmt "$pkgdir"/usr/bin/pestfmt
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/pestfmt/LICENSE
}
