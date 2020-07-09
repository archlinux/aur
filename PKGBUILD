# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=cross
pkgdesc="'Zero setup' cross compilation and 'cross testing' of Rust crates"
pkgrel=1
pkgver=0.2.1
arch=('x86_64')
url="https://github.com/rust-embedded/cross"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
optdepends=('docker: provide container'
            'podman: provide container')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rust-embedded/cross/archive/v$pkgver.tar.gz")
sha256sums=('150ab0d7cd8f05f3d63df7aa0ea7ef32af6732c89712d671c6be1c40ecab1cdb')

build() {
	cd $pkgname-$pkgver
	cargo build --release --locked
}

package() {
    depends+=('rustup')
    cd $pkgname-$pkgver
    install -Dm644 "LICENSE-APACHE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-APACHE
    install -Dm644 "LICENSE-MIT" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-MIT
	install -Dm755 "target/release/cross" "$pkgdir/usr/bin/cross"
}
