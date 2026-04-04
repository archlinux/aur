# Maintainer: fabse

pkgname=mistral.rs-git
_pkgname=mistral.rs
pkgver=v0.6.0.r149.gd24c6e58b
pkgrel=1
pkgdesc="Blazingly fast LLM inference"
arch=('aarch64' 'x86_64')
url="https://github.com/EricLBuehler/mistral.rs"
license=("MIT")
depends=('openssl')
makedepends=('cargo' 'git')
conflicts=("mistralrs")
provides=("mistralrs")
source=('git+https://github.com/EricLBuehler/mistral.rs')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
	install -Dm755 "target/release/mistralrs" "$pkgdir/usr/bin/mistralrs"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('SKIP')
