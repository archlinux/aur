# Maintainer: Dawid Potocki <archlinux a dawidpotocki , com>

_pkgname=flow
pkgname=river-flow
pkgver=0.2.1
pkgrel=2
pkgdesc='Small utility that brings some extra commands to control river'
arch=('x86_64')
url='https://github.com/stefur/flow'
license=('MIT')
makedepends=('cargo')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/stefur/flow/archive/v${pkgver}.tar.gz")
sha256sums=('7c4060387d2e4119bebf493ad2a40a49a08b45d5f09f821ad3c5f5cac3f248a4')

prepare() {
	cd "${_pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN="stable"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${_pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN="stable"
	export CARGO_TARGET_DIR="target"
	cargo build --frozen --release --all-features
}

package() {
	cd "${_pkgname}-${pkgver}"

	install -Dm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
