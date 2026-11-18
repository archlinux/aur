# Maintainer: kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-FileCopyrightText: 2026 kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-License-Identifier: 0BSD

pkgname="cargo-leptos-bin"
pkgdesc="Build tool for the Rust framework Leptos (pre-built binary)"
pkgver=0.3.11
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
sha256sums_x86_64=("1c9cf0e1e3ffae6c8b58d29281d949dab560cea613b80d361f323f93071df7c8")
sha256sums_aarch64=("8aa36d841d69fb62fa00a3e0d8670a52dc16a9a94c2c6f96c545d889c49f18aa")

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
