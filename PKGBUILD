# Maintainer: KumihoIO <bot@construct.dev>
pkgname=construct
pkgver=2026.5.15
pkgrel=1
pkgdesc="Zero overhead. Zero compromise. 100% Rust. The fastest, smallest AI assistant."
arch=('x86_64')
url="https://github.com/KumihoIO/construct-os"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KumihoIO/construct-os/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('089ef5d4fd3fbd6ca3f166d762f6c902b0fa89fb7caa6dfdf838d21146953d21')

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
