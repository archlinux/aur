pkgname=nettui
pkgver=0.1.8
pkgrel=1
pkgdesc="Unified TUI for Wi-Fi and Ethernet"
arch=("x86_64")
url="https://github.com/skibidiandulka/nettui"
license=("GPL-3.0-only")
depends=("glibc" "gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("a89029229f8074489cafbcdde5db328071d51509e0dda370b310864bfa52435e")

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
