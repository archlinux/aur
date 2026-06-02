# Maintainer: Xuepoo <xuepoo@users.noreply.github.com>
pkgname=waywarp
pkgver=0.1.4
pkgrel=1
pkgdesc="A high-performance keyboard-driven mouse control tool for Wayland compositors (compiled from source)"
arch=('x86_64')
url="https://github.com/Xuepoo/waywarp"
license=('MIT')
depends=('cairo' 'pango' 'libxkbcommon' 'wayland')
makedepends=('cargo')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "waywarp-${pkgver}/waywarp"
  export CARGO_HOME="${srcdir}/cargo"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "waywarp-${pkgver}/waywarp"
  export CARGO_HOME="${srcdir}/cargo"
  cargo build --frozen --release --all-features
}

package() {
  cd "waywarp-${pkgver}/waywarp"
  install -Dm755 "target/release/waywarp" "${pkgdir}/usr/bin/waywarp"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
