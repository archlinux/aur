# Maintainer: fabse

pkgname=ferrumc-git
_pkgname=ferrumc
pkgver=0.0.r1789.ffa2316e
pkgrel=1
pkgdesc="A reimplementation of the minecraft server in rust."
arch=('aarch64' 'x86_64')
url="https://github.com/ferrumc-rs/ferrumc"
license=("MIT")
depends=('openssl')
makedepends=('cargo' 'git')
conflicts=("ferrumc")
provides=("ferrumc")
source=('git+https://github.com/ferrumc-rs/ferrumc')

pkgver() {
	cd "$_pkgname"
	printf "0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"	
}

prepare() {
	cd "$_pkgname"
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_pkgname"
	cargo build --release
}

package() {
	cd "$_pkgname"
	install -Dm755 "target/release/ferrumc" "$pkgdir/usr/bin/ferrumc"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('SKIP')
