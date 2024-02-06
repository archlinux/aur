# Maintainer: sublipri <sublipri at proton dot me>
pkgname=bom-buddy
pkgver=0.1.1
pkgrel=1
pkgdesc="Australian weather CLI utility"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/sublipri/bom-buddy"
license=('GPL-3.0-only')
optdepends=('mpv: view radar loops')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sublipri/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3a88181ea74e03a8ec80b779beff370c6ca6c673c80a33f49f4c41303c130ed2')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
