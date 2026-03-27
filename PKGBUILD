# Maintainer: kleines Filmröllchen <kleines at filmroellchen dot eu>
# Contributor: Funami
# SPDX-FileCopyrightText: 2026 kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-License-Identifier: 0BSD

pkgname="wasm-pack-bin"
pkgdesc="Your favorite Rust -> Wasm workflow tool"
pkgver=0.14.0
pkgrel=2
arch=("x86_64" "aarch64")
url="https://github.com/wasm-bindgen/wasm-pack"
_ghurl="https://github.com/wasm-bindgen/wasm-pack"
license=("MIT" "Apache-2.0")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(!debug)

source_x86_64=("${_ghurl}/releases/download/v${pkgver}/wasm-pack-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${_ghurl}/releases/download/v${pkgver}/wasm-pack-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=("278a8d668085821f4d1a637bd864f1713f872b0ae3a118c77562a308c0abfe8d")
sha256sums_aarch64=("5941c7b05060440ff37ee50fe9009a408e63fa5ba607a3b0736f5a887ec5f2ca")

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
