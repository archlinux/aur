# Maintainer: sublipri <sublipri at proton dot me>
pkgname=bom-buddy
pkgver=0.1.0
pkgrel=1
pkgdesc="Australian weather CLI utility"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/sublipri/bom-buddy"
license=('GPL-3.0-only')
optdepends=('mpv: view radar loops')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sublipri/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2c9ce5e88686c968107cf3931e9a13809573c80b4c57b167c9dccfa4ca8498e4')

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
