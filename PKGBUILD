# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=vobsubocr
pkgver=0.1.0
pkgrel=1
pkgdesc='Blazingly fast and accurate DVD VobSub to SRT subtitle conversion'
arch=(x86_64)
url=https://github.com/elizagamedev/vobsubocr
license=(GPL3)
depends=(tesseract)
makedepends=(cargo clang)
source=("${pkgname}"-"${pkgver}".tar.gz::"${url}"/archive/refs/tags/v"${pkgver}".tar.gz)
sha256sums=('3a147b36ed03f6323564dc3a45bd4eaa090ca75a8726d3f103803ed6723d6fdc')

prepare() {
	cd "${pkgname}"-"${pkgver}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname}"-"${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}-${pkgver}/target/release/${pkgname}"
}
