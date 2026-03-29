# Maintainer: Elia Nitsche <nitscheelia at gmail dot com>
# Contributor: Yigid BALABAN <fyb at fybx.dev> 
pkgname=ianny
pkgver=2.1.3
pkgrel=1
pkgdesc="Desktop utility that helps preventing repetitive strain injuries by periodically informing the user to take breaks."
arch=('x86_64')
url="https://github.com/zefr0x/ianny"
license=('GPL-3.0-only')
depends=(dbus glibc gcc-libs)
makedepends=(cargo meson)
provides=(ianny)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zefr0x/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('12b1d618d67a049fdac3065986b083cc6c323bb4eaecc6a68f722cb55a2e4155')

prepare() {
	cd "$pkgname-$pkgver"
	# prepare build environment
	arch-meson build
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	meson compile -C build
}

package() {
	cd "$pkgname-$pkgver"
	meson install -C build --destdir "${pkgdir}"
}
