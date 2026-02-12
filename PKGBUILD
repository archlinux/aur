pkgname=nettui
pkgver=0.1.9
pkgrel=1
pkgdesc="Unified TUI for Wi-Fi and Ethernet"
arch=("x86_64")
url="https://github.com/skibidiandulka/nettui"
license=("GPL-3.0-only")
depends=("glibc" "gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("21e0bc0dca9118c4d5038fc74d58e0f77c1651c29f5a34259d82d4ffeb1d1001")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/nettui" "${pkgdir}/usr/bin/nettui"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/nettui/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/nettui/LICENSE"
  install -Dm644 "config/keybinds.toml.example" "${pkgdir}/usr/share/doc/nettui/keybinds.toml.example"
}
