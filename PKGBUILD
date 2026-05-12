# Maintainer: sinisterMage <ofek dot bickel at gmail dot com>

pkgname=neomake
pkgver=0.1.0
pkgrel=1
pkgdesc='TOML/TOMLX-driven parallel build orchestrator with content-addressable caching'
arch=('x86_64')
url='https://github.com/sinisterMage/neomake'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'git')
_commit=0595fa86f3f0dcc3d36fc0a9af921d9d5d9d62d3
source=("neomake::git+https://github.com/sinisterMage/neomake.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
	cd "$srcdir/neomake"
	cargo build --release --locked -p neomake
}

check() {
	cd "$srcdir/neomake"
	cargo test --workspace --locked
}

package() {
	cd "$srcdir/neomake"
	install -Dm755 target/release/neomake -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
