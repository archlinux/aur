# Maintainer: Khaled Eldoheiri <khaled@eldoheiri.com>
pkgname=wltile
pkgver=1.3.0
pkgrel=1
pkgdesc="A CLI tool that manages outputs/displays for wlroots based compositors"
url="https://codeberg.org/kdehairy/wltile"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL3')
depends=()
makedepends=('git' 'cargo')
provides=("${pkgname}")
source=("v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("197d7b07f5a127106ce8d0afe3ca0ddbd4ccd39193c8b9d99b376e1a7019c72a")

prepare() {
	export RUSTUP_TOOLCHAIN=stable

	cd "${srcdir}/${pkgname}"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cd "${srcdir}/${pkgname}"
	cargo build --frozen --release --all-features
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
}
