# Maintainer: Aethar <elliott.ashby88@gmail.com>

pkgname=lrclibfetch
pkgver=1.0.1
pkgrel=1
pkgdesc="A cli for LRCLIB."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/Aethar01/lrclibfetch"
license=('MIT')
makedepends=('cargo')
provides=('lrclibfetch')
options=('!lto')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c2e1b36e8241ca50586a6623ac9a347358a36ffd29237a8b09645dff1c4efc9f')

prepare() {
	cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
	cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
	cd "${pkgname}-${pkgver}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 target/release/${pkgname} "$pkgdir/usr/bin/${pkgname}"
}
