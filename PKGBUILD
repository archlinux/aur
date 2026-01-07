# Maintainer: Aethar <elliott.ashby88@gmail.com>

pkgname=lrclibfetch
pkgver=1.0.2
pkgrel=2
pkgdesc="A cli for LRCLIB."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/Aethar01/lrclibfetch"
license=('MIT')
makedepends=('cargo')
provides=('lrclibfetch')
options=('!lto')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1d6a91af6f4bce73daa1b40ce13d430a43dd29bf781f1498597ea281b39f2d00')

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
