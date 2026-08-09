# Maintainer: Monapp <monapp@posteo.com>

pkgname=forkme
pkgver=0.2.0.2
_pkgver='cee4760e2c9cd377429e394772106a82bb4c3a76'
pkgrel=3
pkgdesc='A tool for managing forks using a patch-based approach'
arch=('x86_64')
url='https://tangled.org/me.webbeef.org/forkme'
license=('AGPL-3.0-only')
makedepends=('git' 'cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver?format=tar.gz")
provides=('forkme')
sha256sums=('449a8dac037c178f6206e43b51f812d09e3d9120f90b4c10bc0885b7842ec996')

prepare() {
	cd "$pkgname-$_pkgver"
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$pkgname-$_pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release
}

package() {
	install -Dm755 "$pkgname-$_pkgver/target/release/forkme" -t "${pkgdir}/usr/bin"
}
