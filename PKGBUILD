# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=mdbook-admonish
pkgver=1.18.0
pkgrel=1
pkgdesc="A preprocessor for mdbook to add Material Design admonishments"
url="https://github.com/tommilligan/mdbook-admonish"
arch=('x86_64')
license=('MIT')
makedepends=(
  'cargo'
)
depends=(
  'mdbook'
)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('73391ef3cbe6df63aac7f2685a9ff2a38a8a681748fdb5953f3381dc1db2379f')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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

