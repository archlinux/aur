# Maintainer: Martin Pugh <martin at parity dot io>
pkgname=polkadot
pkgdesc="Polkadot Node Implementation"
pkgrel=1
pkgver=0.8.3
arch=('x86_64')
url="https://github.com/paritytech/${pkgname}"
license=('GPL3')
makedepends=('rustup' 'clang')
source=("${pkgname}::git+https://github.com/paritytech/${pkgname}.git")
sha256sums=("SKIP")

build() {
  rustup install nightly
  rustup target add wasm32-unknown-unknown
	cd ${pkgname}
  git checkout "v${pkgver}"
	cargo build --release
}

package() {
	install -D -m755 "${srcdir}/${pkgname}/target/release/polkadot" "${pkgdir}/usr/bin/polkadot"
}
