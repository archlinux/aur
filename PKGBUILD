# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=rsyn
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="[alpha] Wire-compatible rsync client in Rust"
arch=(any)
url="https://github.com/sourcefrog/rsyn/"
license=('Apache')
groups=()
depends=(gcc-libs glibc)
makedepends=(cargo)
checkdepends=()
optdepends=()
provides=(rsyn)
conflicts=(rsyn-git)
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/sourcefrog/rsyn/archive/refs/tags/v$pkgver.tar.gz"
        )
noextract=()
sha256sums=('f7fc062a63ebf1a6f35eae789028f238484881adacfc8828f2a4d7c1027456c0')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
    	export CARGO_TARGET_DIR=target
    	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
    	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/rsyn"
    	install -Dm644 LICENSE* -t $pkgdir/usr/share/licenses/$pkgname/
}
