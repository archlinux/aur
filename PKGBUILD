# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=mdbook-pagetoc
pkgver=0.2.0
pkgrel=2
pkgdesc="A preprocessor for mdbook to render a table of contents for each page"
url="https://github.com/slowsage/mdbook-pagetoc"
arch=('x86_64')
license=('MPL-2.0')
makedepends=(
  'cargo'
)
depends=(
  'mdbook'
)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0101c3d8931345d43a17f02cb12cde86f7120fda51bcdd4137736b6361f6eabf')

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

