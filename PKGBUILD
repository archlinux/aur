# Maintainer: Sherlock Holo <sherlock ya at gmail.com>
pkgname=deepseek-tui
pkgver=0.8.2
pkgrel=1
pkgdesc="A terminal-native coding agent for DeepSeek V4 models with 1M-token context"
arch=('x86_64' 'aarch64')
url="https://github.com/Hmbown/DeepSeek-TUI"
license=('MIT')
depends=('openssl' 'libxcb' 'wayland')
makedepends=('cargo' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('74a6b7761d15dc6cde7e09e2b4a6022987ad73371a6c29bd3a0df6fb485c49df')

build() {
  cd "DeepSeek-TUI-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "DeepSeek-TUI-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "DeepSeek-TUI-${pkgver}"
  install -Dm755 "target/release/deepseek" -t "${pkgdir}/usr/bin/"
  install -Dm755 "target/release/deepseek-tui" -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
