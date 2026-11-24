# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=albatross-cli
pkgver=2.5.0
pkgrel=1
pkgdesc="Terminal-first AI coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/morganlinton/albatross"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3ec38e21b27aeaca2effaffe40e2cdbb0c37b64f0076579a749e7aabd6dd7465')

prepare() {
  cd "Albatross-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "Albatross-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "Albatross-${pkgver}"
  install -Dm755 "target/release/albatross" "${pkgdir}/usr/bin/albatross-cli"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
