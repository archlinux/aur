# Maintainer: Khaled Eldoheiri <khaled@eldoheiri.com>
pkgname=wltile
pkgver=1.2.0
pkgrel=2
pkgdesc="A CLI tool that positions outputs/displays for wlroots based compositors"
url="https://gitlab.com/eldoheiri/wltile"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL3')
depends=()
makedepends=('git' 'cargo')
provides=("${pkgname}")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=("8d325f5e5ab27cf47737f721279cba5cb62bf327f8731f2a692b210379948e0c")

prepare() {
	export RUSTUP_TOOLCHAIN=stable

	cd "${srcdir}/${pkgname}-v${pkgver}"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cd "${srcdir}/${pkgname}-v${pkgver}"
	cargo build --frozen --release --all-features
}

package() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
}
