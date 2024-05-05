# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=mdbook-graphviz
pkgver=0.2.0
pkgrel=4
pkgdesc="A preprocessor for mdbook to renders graphs using Graphviz"
url="https://github.com/dylanowen/mdbook-graphviz"
arch=('x86_64')
license=('MPL-2.0')
makedepends=(
  'cargo'
)
depends=(
  'graphviz'
  'mdbook'
)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7a74d7a12bd2a0b7a119d0b14ca7e7d3840acb347debff9ec0ad4d4add026785')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

