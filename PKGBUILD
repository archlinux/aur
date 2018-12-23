pkgname=cargo-binutils
pkgver=0.1.6
pkgrel=2
pkgdesc=''
url="https://github.com/rust-embedded/$pkgname"
arch=('x86_64')
license=('Apache' 'MIT')
depends=('rustup' 'cargo')
install="$pkgname.install"
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('5514aefc982944c9fb965881a533817a4faaad883c871daa6fd5c820ce91ef6f')

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
