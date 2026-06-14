# Maintainer: kleines Filmröllchen <kleines at filmroellchen dot eu>
# Contributor: Funami
# SPDX-FileCopyrightText: 2026 kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-License-Identifier: 0BSD

pkgname="wasm-pack-bin"
pkgdesc="Your favorite Rust -> Wasm workflow tool"
pkgver=0.15.0
pkgrel=1
arch=("x86_64" "aarch64")
url="https://github.com/wasm-bindgen/wasm-pack"
_ghurl="https://github.com/wasm-bindgen/wasm-pack"
license=("MIT" "Apache-2.0")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(!debug)

source_x86_64=("${_ghurl}/releases/download/v${pkgver}/wasm-pack-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${_ghurl}/releases/download/v${pkgver}/wasm-pack-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=("c09f971ecaed9a2efc80fdcea7a00ef6b53c7fadc8c57d1f61b53a6aa66b668a")
sha256sums_aarch64=("e17ef0806381c3a0acb9c9ddad643a49facaa5a2ecf657a421d4d8f3357a24b7")

optdepends=(
	'rust: for building Rust crates'
	'rustup: for building Rust crates and installing Wasm toolchains'
)

package() {
	cd "${srcdir}/wasm-pack-v${pkgver}-${CARCH}-unknown-linux-musl"
	install -Dm755 "wasm-pack" -t "${pkgdir}/usr/bin"
	install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
