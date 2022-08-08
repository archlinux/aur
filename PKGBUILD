# Maintainer: Jonas Riedel <jonasriedel@protonmail.com>

pkgname=rustyfetch
pkgver=0.1.7
pkgdesc="Fetch stuff with Rust!"
pkgrel=1
arch=('x86_64')
url="https://github.com/jonasrdl/rustfetch"
license=('MPL-2.0')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('SKIP')

build(){
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# use cargo to build from a tagged release
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release --all-features
	cd -
}

package(){
	# install executable
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
