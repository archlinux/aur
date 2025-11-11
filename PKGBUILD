# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=cargo-lock
pkgver=11.0.0
pkgrel=1
pkgdesc="Self-contained Cargo.lock parser"
url="https://github.com/rustsec/rustsec/tree/main/cargo-lock"
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
arch=('x86_64')
license=('Apache-2.0 OR MIT')
source=("https://github.com/rustsec/rustsec/archive/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('b35ece398a637f3fc9ba1c0e0713182efe3132dc2a89014c58d9a6248e37bc29aaaa6a5483744f48e333ce26b76ee28c63f58d7173f5c830a6e5dc034e4923bd')

prepare() {
  cd "rustsec-${pkgname}-v${pkgver}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "rustsec-${pkgname}-v${pkgver}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "rustsec-${pkgname}-v${pkgver}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "rustsec-${pkgname}-v${pkgver}/${pkgname}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
