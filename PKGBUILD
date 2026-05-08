# Maintainer: KumihoIO <bot@construct.dev>
pkgname=construct
pkgver=2026.5.7
pkgrel=1
pkgdesc="Zero overhead. Zero compromise. 100% Rust. The fastest, smallest AI assistant."
arch=('x86_64')
url="https://github.com/KumihoIO/construct-os"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KumihoIO/construct-os/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bc536ad842e2d5cffe2ac987087adae55d4079cdf51fbbdaf03b433851b9941f')

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
