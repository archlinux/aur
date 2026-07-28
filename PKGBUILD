# Maintainer: Khaled Eldoheiri <khaled@eldoheiri.com>
pkgname=wltile
pkgver=1.3.1
pkgrel=1
pkgdesc="A CLI tool that manages outputs/displays for wlroots based compositors"
url="https://github.com/kdehairy/wltile"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL3')
depends=()
makedepends=('git' 'cargo')
provides=("${pkgname}")
source=("v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("4ec6e133d632540185941249bc2f9686dda799146b777daff8db01e93a13a1ee")

prepare() {
	export RUSTUP_TOOLCHAIN=stable

	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --frozen --release --all-features
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
}
