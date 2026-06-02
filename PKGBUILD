pkgname=dcr-dev
pkgver=0.7.0
pkgrel=1
pkgdesc="Cargo-like utility to manage C/C++ projects (development release)"
arch=('x86_64' 'aarch64')
url="https://github.com/dexoron/dcr"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
options=('!lto')
provides=('dcr')
conflicts=('dcr')
optdepends=(
  'gcc: build C/C++ projects with GCC'
  'clang: build C/C++ projects with Clang'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/dexoron/dcr/archive/refs/tags/v0.7.0-dev.tar.gz")
sha256sums=('f55dda7cdadafd2b35d3bdea030aa5578c251f07924972d5d00a94ac047f2410')

build() {
  cd "$srcdir/dcr-0.7.0-dev"
  unset CFLAGS CXXFLAGS LDFLAGS
  export RUSTFLAGS="-C linker=cc"
  cargo build --release --locked
}

package() {
  cd "$srcdir/dcr-0.7.0-dev"
  install -Dm755 "target/release/dcr" "$pkgdir/usr/bin/dcr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
