# Maintainer: kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-FileCopyrightText: 2026 kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-License-Identifier: 0BSD

pkgname="cargo-leptos-bin"
pkgdesc="Build tool for the Rust framework Leptos (pre-built binary)"
pkgver=0.3.7
pkgrel=1
arch=("x86_64" "aarch64")
url="https://github.com/leptos-rs/cargo-leptos"
_ghurl="https://github.com/leptos-rs/cargo-leptos"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
options=(!debug)

source_x86_64=("${_ghurl}/releases/download/v${pkgver}/cargo-leptos-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_ghurl}/releases/download/v${pkgver}/cargo-leptos-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=("fda80f4845e92d0e8f5ec13cf1a46982ba7a518ae01182e7e4201312944bc05d")
sha256sums_aarch64=("70e0c1cdf47f3c26c90ab4a020f8fcd9206233cc34b321c1aa37f7a554aa3bad")

depends=('cargo' 'cargo-generate' 'binaryen')
optdepends=(
	'dart-sass: sass support'
)

package() {
	cd "${srcdir}/cargo-leptos-${CARCH}-unknown-linux-gnu"
	install -Dm755 "cargo-leptos" -t "${pkgdir}/usr/bin"
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
