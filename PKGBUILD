# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=mdbook-graphviz
pkgver=0.2.1
pkgrel=1
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
sha256sums=('76b0880f74e2a9a2d271f6810181e888fc108bd1184589d115bfa6c491ea964b')

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

