# Maintainer: KumihoIO <bot@revka.dev>
pkgname=revka
pkgver=2026.6.12
pkgrel=1
pkgdesc="Zero overhead. Zero compromise. 100% Rust. The fastest, smallest AI assistant."
arch=('x86_64')
url="https://github.com/KumihoIO/Revka"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KumihoIO/Revka/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e3c26f875d72002354e86dd53fa688216e6840a87a185330749dcb53f0662f69')

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
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/dist/revka"
  install -Dm0644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm0644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
