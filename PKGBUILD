# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=mdbook-template
pkgver=1.1.1+deprecated
_pkgver=1.1.1-deprecated
pkgrel=1
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
sha256sums=('bd3d4d04f9c8d6313204350660554617329f2226f20f3735cf87ba3aa284988e')

prepare() {
  cd "${pkgname}-${_pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

check() {
  cd "${pkgname}-${_pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

build() {
  cd "${pkgname}-${_pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname}-${_pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

