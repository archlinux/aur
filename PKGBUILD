pkgname=cargo-binutils
pkgver=0.2.0
pkgrel=1
pkgdesc='Cargo subcommands to invoke the LLVM tools shipped with the Rust toolchain'
url="https://github.com/rust-embedded/$pkgname"
arch=('x86_64')
license=('Apache' 'MIT')
depends=('rustup' 'cargo')
install="$pkgname.install"
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('a9f6e581e8f00dc98d043218ee2c36eb7d8b21398a1b97f24100dbe6e2084846')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"

	for binary in 'nm' 'objcopy' 'objdump' 'profdata' 'readobj' 'size' 'strip'; do
		install -Dm755 "target/release/cargo-$binary" "$pkgdir/usr/bin/cargo-$binary"
	done
}
