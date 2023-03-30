# Maintainer: qubidt <qubidt at gmail dot com>
# Contributor: Robin Appelman <robin@icewind.nl>

pkgname=persway
pkgver=0.6.2
pkgrel=1
pkgdesc="Small Sway IPC Daemon"
url="https://github.com/johnae/persway"
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/johnae/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('c876bf49612e968dd2cc1f3a6dedda15bc5beffc771888dfbaae5759aa14bbf1b765c28eacb8710a81866d96c3334f10cdee4bb68c03318b2fa431fed643624a')

prepare() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --frozen
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -vDm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
