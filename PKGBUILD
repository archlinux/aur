# Maintainer: KumihoIO <bot@construct.dev>
pkgname=construct
pkgver=2026.4.28
pkgrel=1
pkgdesc="Zero overhead. Zero compromise. 100% Rust. The fastest, smallest AI assistant."
arch=('x86_64')
url="https://github.com/KumihoIO/construct-os"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KumihoIO/construct-os/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bd4af9b2e5b684a2aeaca622bd5a4291bcbcc048eb1d6667d61b5d4911e0db89')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --profile dist
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/dist/construct"
  install -Dm0644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm0644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
