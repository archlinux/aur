# Maintainer: James Forster <james.forsterer@gmail.com>

pkgname=metapac
pkgver=0.7.1
pkgrel=1
pkgdesc="multi-backend declarative package manager"
url="https://github.com/ripytide/${pkgname}"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("metapac")
conflicts=("metapac")
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
options=(!debug !lto)
sha256sums=('be893f3cb5ce8c8f6c81f17f329213ef5e9871eeef2fb3df19d9ff70ba8adeb7')

prepare() {
	cd "${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
}
