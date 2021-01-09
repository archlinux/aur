# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=wasm-bindgen-cli
pkgver=0.2.69
pkgrel=1
pkgdesc="Command line interface of the wasm-bindgen attribute and project."
arch=(x86_64)
url="https://github.com/rustwasm/wasm-bindgen"
license=(APACHE MIT)
depends=(
rust-wasm
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rustwasm/wasm-bindgen/archive/${pkgver}.tar.gz")
sha256sums=('207645bdd2a0c927593fe34a75fe93bd8a69f82525d160e99429307b51d11f01')

export CARGO_HOME="${srcdir}/cargo_home"

prepare() {
  cd wasm-bindgen-${pkgver}/crates/cli
  export CARGO_HOME="${srcdir}/cargo_home"
  cargo fetch 
}

build() {
  cd wasm-bindgen-${pkgver}/crates/cli
  #export CARGO_HOME="${srcdir}/cargo_home"
  cargo build --release --offline --all-features --target-dir=target
}

check() {
  cd wasm-bindgen-${pkgver}/crates/cli
  #export CARGO_HOME="${srcdir}/cargo_home"
  cargo test --release --offline --target-dir=target
}

package(){
  cd wasm-bindgen-${pkgver}/crates/cli
  find target/release -maxdepth 1 -executable -type f -exec install -Dm 755 "{}" -t "${pkgdir}"/usr/bin \;
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE-MIT
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE-APACHE
}

