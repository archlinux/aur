# Maintainer: Elia Nitsche <nitscheelia at gmail.com>
# Contributor: Yigid BALABAN <fyb at fybx.dev> 
pkgname=ianny
pkgver=2.1.1
pkgrel=1
pkgdesc="Desktop utility that helps preventing repetitive strain injuries by periodically informing the user to take breaks."
arch=('x86_64')
url="https://github.com/zefr0x/ianny"
license=('GPL-3.0-only')
depends=(dbus glibc gcc-libs)
makedepends=(cargo meson)
provides=(ianny)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zefr0x/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a3fb1af65abdbd3dda90c06310cb5e4c461707f61aad4e6727fa852ee5dc9c35')

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

