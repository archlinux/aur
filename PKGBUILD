# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=effer
pkgver=2.0.3
pkgrel=1
pkgdesc="Encrypted CLI Notepad written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/Merkoba/Effer"
license=('Apache')
makedepends=('cargo')
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7e4c6d57bdabb3e56296aade7ed69b552f1c4194b758e85bd6aeb966322cc96e7adc51c9e0a95baa2844b387374c0155dbd40af57cad18c4c94ae5a6473893e7')

prepare() {
    cd "${pkgname^}-${pkgver}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname^}-${pkgver}"
		export RUSTUP_TOOLCHAIN=stable
		export CARGO_TARGET_DIR=target
		cargo build --frozen --release --all-features
}

check() {
		cd "${pkgname^}-${pkgver}"
		export RUSTUP_TOOLCHAIN=stable
		cargo test --frozen
}

package() {
  cd "${pkgname^}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
