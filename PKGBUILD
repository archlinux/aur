# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=mdbook-footnote
pkgver=0.2.0
pkgrel=1
pkgdesc="A preprocessor for mdbook to support the inclusion of footnotes"
url="https://github.com/daviddrysdale/mdbook-footnote"
arch=('x86_64')
license=('Apache-2.0')
makedepends=(
  'cargo'
)
depends=(
  'mdbook'
)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f814ea4195734e59701565bb008f0f432628806d28e580af1038774448cbffeb')

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

