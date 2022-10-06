# Maintainer: Lars Francke <lars.francke@stackable.tech>

_commit=a968ab57bfa668f93d099f1cd0eff2b943e7dfa6
pkgname=stackablectl
pkgver=0.5.0
pkgrel=1
pkgdesc="Commandline tool to interact with a Stackable Data Platform"
arch=('x86_64')
url="https://github.com/stackabletech/stackablectl/"
license=('Apache')
makedepends=('go' 'rust')
source=("$pkgname::git+https://github.com/stackabletech/stackablectl.git#commit=$_commit")
b2sums=('SKIP')

prepare() {
  	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname"
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"

	install -vDm755 -t "$pkgdir/usr/bin" target/release/stackablectl
}
