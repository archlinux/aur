# Maintainer: Monapp <monapp@posteo.com>

pkgname=forkme
pkgver=0.2.0
pkgrel=1
pkgdesc='A tool for managing forks using a patch-based approach'
arch=('x86_64')
url='https://tangled.org/me.webbeef.org/forkme'
license=('AGPL-3.0-only')
makedepends=('git' 'cargo')
options=('!lto')
source=("$pkgname::git+$url.git#commit=cee4760e2c9cd377429e394772106a82bb4c3a76")
provides=('forkme')
sha256sums=(SKIP)

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release
}

package() {
	forkmepath=$pkgname/target/release
	install -Dm0755 -t "$pkgdir/opt/forkme/" "$forkmepath/forkme"
}
