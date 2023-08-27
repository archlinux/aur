# Maintainer: Light Ning <lightning1141@gmail.com>

pkgname=cargo-info
pkgver=0.7.0
pkgrel=0
pkgdesc='cargo-info subcommand - show crates info from crates.io'
arch=(x86_64 aarch64)
url="https://github.com/light4/cargo-info"
license=('Apache' 'MIT')
depends=('gcc-libs')
conflicts=('cargo-info')
provides=('cargo-info')
makedepends=('rust' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/light4/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('de7c6f495f2addc4e4ae59b6451c20cb089917f40ee455103d5f2baedfe80634')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked
}

build() {
  cd $pkgname-$pkgver
  cargo build --frozen --release --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
