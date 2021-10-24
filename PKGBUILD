# Maintainer: Riccardo Sacchetto <rsacchetto@nexxontech.it>
pkgname=whatstux
pkgver=0.1.0
pkgrel=1
pkgdesc="Super simple Rust+GTK WhatsApp Web Client"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/nexxontech/whatstux"
license=('GPL3')
depends=('gtk3' 'webkit2gtk')
makedepends=('cargo')
source=("https://gitlab.com/nexxontech/whatstux/-/archive/${pkgver}/whatstux-${pkgver}.tar.gz"
        "whatstux.desktop")
sha512sums=("1489b69967465cbcc8010d9a62b4a800d924d24b4727b712eab4772f4df0ac43d0fad53291aabf59892fa41f06f8fb959f503c332c41cfe5d8b0316ced4fc81a"
            "c09392e9c4bae32fa59d32b3ae78b77e079ea526af96454e89638179b6357dec25edaf304f1699aaf5375a5f8e1ba82caeba441c5ab4a30c7c35440d71cf8ee1")

prepare() {
	cd "${srcdir}/whatstux-${pkgver}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${srcdir}/whatstux-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
	cd "${srcdir}/whatstux-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

	cd "${srcdir}"
    install -Dm644 ./whatstux.desktop "${pkgdir}/usr/share/applications/whatstux.desktop"
}
