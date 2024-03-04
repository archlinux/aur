# Maintainer: Neurognostic <neurognostic@astranetics.com>
# Contributor: Eric Sandoval <esandovalruezga@gmail.com>
# Contributor: Alexander Samoylenko <lxmnk@tuta.io>
_pkgname=xidlehook
pkgname=$_pkgname-withdrawnwin
pkgver=0.10.1
pkgrel=2
pkgdesc='xautolock rewrite in Rust, with a few extra features (withdrawn window patched fork)'
url='https://github.com/realSaltyFish/xidlehook'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('rust' 'libxss' 'python')
optdepends=()
depends=('libpulse' 'libxcb')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f2d5d400031a1a4aeeb6950fd04ff51350628153ec9c4d74d9d9f1070e827cb5')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	cargo build --release
}

check() {
	cd "$srcdir/$_pkgname-$pkgver"
	cargo test --manifest-path xidlehook-core/Cargo.toml
	cargo test --all-features --manifest-path xidlehook-core/Cargo.toml

	cargo test --manifest-path xidlehook-daemon/Cargo.toml
	cargo test --all-features --manifest-path xidlehook-daemon/Cargo.toml
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 755 -t "$pkgdir/usr/bin" "target/release/$_pkgname"{,-client}
}
