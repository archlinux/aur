# Maintainer: Joseph Gagnon <joe.atticlabs@gmail.com>

pkgname=vhdl-ls
pkgver=0.86.0
pkgrel=1
pkgdesc="Language server for VHDL Written in rust"
arch=(x86_64)
url="github.com/VHDL-LS/rust_hdl"
license=('MPL-2.0')
depends=()
makedepends=('rust' 'cargo')
provides=('vhdl-ls')
conflicts=('rust_hdl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/VHDL-LS/rust_hdl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('975f2ee65792e4f6048f31fccb24821800ceb3f4cbdb873df448da468e907304')

build() {
    cd "rust_hdl-$pkgver"
    cargo build --release --locked
}

package() {
    cd "rust_hdl-$pkgver"
    install -Dm755 target/release/vhdl_ls "$pkgdir/usr/bin/vhdl_ls"
    install -dm755 "$pkgdir/usr/lib/rust_hdl"
    cp -r vhdl_libraries "$pkgdir/usr/lib/rust_hdl/vhdl_libraries"
}
