pkgname=nettui
pkgver=0.4.1
pkgrel=1
pkgdesc="Unified TUI for Wi-Fi and Ethernet"
arch=("x86_64")
url="https://github.com/skibidiandulka/nettui"
license=("GPL-3.0-only")
options=("!debug")
depends=("glibc" "gcc-libs")
conflicts=("nettui-bin" "nettui-git")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("387528343684f52ab95752d0c655228730e842771b9c4c3ec79620687b2ef3ba")

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
