# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=mdbook-template
pkgver=1.1.0
pkgrel=2
pkgdesc="A preprocessor for mdbook to use template files with dynamic arguments"
url="https://github.com/sgoudham/mdbook-template"
arch=('x86_64')
license=('MIT')
makedepends=(
  'cargo'
)
depends=(
  'mdbook'
)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1f961da5e07f00179b552c68617880952e6120dd1c4e2ccdf89ad7769d315bb5')

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

