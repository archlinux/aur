pkgname=cargo-binutils
pkgver=0.3.6
pkgrel=1
pkgdesc='Cargo subcommands to invoke the LLVM tools shipped with the Rust toolchain'
url="https://github.com/rust-embedded/$pkgname"
arch=('x86_64')
license=('Apache' 'MIT')
depends=('rust' 'cargo')
install="$pkgname.install"
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('431fb12a47fafcb7047d41bdf4a4c9b77bea56856e0ef65c12c40f5fcb15f98f')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"

	for binary in 'ar' 'cov' 'ld' 'lld' 'nm' 'objcopy' 'objdump' 'profdata' 'readobj' 'size' 'strip'
	do
		install -Dm755 "target/release/rust-$binary" "$pkgdir/usr/bin/rust-$binary"
	done

	for binary in 'cov' 'nm' 'objcopy' 'objdump' 'profdata' 'readobj' 'size' 'strip'
	do
		install -Dm755 "target/release/cargo-$binary" "$pkgdir/usr/bin/cargo-$binary"
	done
}
