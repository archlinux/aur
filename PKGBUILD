# Maintainer: Monapp <monapp@posteo.com>

pkgname=forkme
pkgver=0.2.0.2
pkgrel=2
pkgdesc='A tool for managing forks using a patch-based approach'
arch=('x86_64')
url='https://tangled.org/me.webbeef.org/forkme'
license=('AGPL-3.0-only')
makedepends=('git' 'cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/cee4760e2c9cd377429e394772106a82bb4c3a76?format=tar.gz")
provides=('forkme')
sha256sums=('e5926181160db2d3ddefb7642041e95aea3c7e894f406568faf6bc0e786098df')
_extract_name='3mcl6fchgm322-cee4760e2c9cd377429e394772106a82bb4c3a76'

prepare() {
	mv $_extract_name $pkgname-$pkgver
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release
}

package() {
	forkmepath=$pkgname-$pkgver/target/release
	install -Dm755 "$forkmepath/forkme" -t "${pkgdir}/usr/bin/${pkgname}/"
}
