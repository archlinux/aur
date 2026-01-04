# Maintainer: BTD Master <btdmaster at disroot dot org>
pkgname=leakdice-rust-git
_pkgbase=leakdice-rust
pkgver=r0
pkgrel=1
pkgdesc='Analyse memory leaks by randomly reading process memory'
arch=('x86_64')
url='https://github.com/tialaramex/leakdice-rust'
license=('GPL-2.0-or-later')
depends=()
makedepends=(
  'rust'
)
optdepends=()
options=()
source=("git+https://github.com/tialaramex/leakdice-rust.git")
b2sums=('SKIP')

prepare() {
  cd $_pkgbase
  # Disable opt-level=z, as it can emit bad code
  sed -e 's/^opt-level/#&/' -i Cargo.toml
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $_pkgbase
  cargo build --release --locked
}

package() {
  cd $_pkgbase
  install -Dm755 -t "${pkgdir}"/usr/bin target/release/leakdice-rust
}
