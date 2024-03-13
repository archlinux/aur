# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=cfspeedtest
pkgver=1.2.2
pkgrel=3
pkgdesc="Unofficial CLI for speed.cloudflare.com"
arch=('x86_64')
url="https://github.com/code-inflation/cfspeedtest"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust')
source=("git+$url.git#tag=v$pkgver")
options=("!buildflags")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
    	export RUSTUP_TOOLCHAIN=stable
    	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname"
    	export RUSTUP_TOOLCHAIN=stable
    	export CARGO_TARGET_DIR=target
    	cargo build --frozen --release --target-dir target
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "$srcdir/$pkgname/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm755 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
