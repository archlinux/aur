# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=cross
pkgdesc="'Zero setup' cross compilation and 'cross testing' of Rust crates"
pkgrel=1
pkgver=0.2.0
arch=('x86_64')
url="https://github.com/rust-embedded/cross"
license=('Apache' 'MIT')
depends=('gcc-libs' 'rustup')
optdepends=('docker: provide container'
            'podman: provide container')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rust-embedded/cross/archive/v$pkgver.tar.gz")
sha256sums=('eff1992fd5ba4aa4a027662dcb66ddfd71c16a814400b125b3faeb1c2bcb41a6')

prepare() {
    rustup default stable
}

build() {
	cd $pkgname-$pkgver
	cargo build --release --locked
}

package() {
	cd $pkgname-$pkgver
    install -Dm644 "LICENSE-APACHE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-APACHE
    install -Dm644 "LICENSE-MIT" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-MIT
	install -Dm755 "target/release/cross" "$pkgdir/usr/bin/cross"
}
