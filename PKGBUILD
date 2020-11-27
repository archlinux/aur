pkgname=cargo-binutils
pkgver=0.3.3
pkgrel=1
pkgdesc='Cargo subcommands to invoke the LLVM tools shipped with the Rust toolchain'
url="https://github.com/rust-embedded/$pkgname"
arch=('x86_64')
license=('Apache' 'MIT')
depends=('rust' 'cargo')
install="$pkgname.install"
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('91b37bc56ac50fdd5e96a37de39b42cc01351b1e3e775bfc5b875f0e51eaf9fe')

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
