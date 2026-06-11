# Maintainer: Ecys <rioisthebestiloverio@gmail.com>
pkgname=unifly
pkgver=0.9.1
pkgrel=1
pkgdesc="CLI and TUI for managing UniFi network controllers"
arch=('x86_64' 'aarch64')
url="https://github.com/hyperb1iss/unifly"
license=('Apache-2.0')
depends=('dbus' 'gcc-libs' 'openssl')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('34a5c73a548270f670b9458f07da3ba1a94f1b9c31831fd4c433d6e01d561330')

prepare() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
