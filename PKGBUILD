# Maintainer: Yigid BALABAN <fyb at fybx.dev> 
pkgname=ianny
pkgver=1.0.0
pkgrel=1
pkgdesc="Desktop utility that helps preventing repetitive strain injuries by keeping track of usage patterns and periodically informing the user to take breaks."
arch=('x86_64')
url="https://github.com/zefr0x/ianny"
license=('GPL-3.0-only')
depends=(dbus glibc gcc-libs)
makedepends=(cargo meson)
provides=(ianny)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zefr0x/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('51451eae00e31aea9b58fbba3e170c81378ee34dd31be78f5e71eb9839db7e4d')

prepare() {
	cd "$pkgname-$pkgver"
	# export RUSTUP_TOOLCHAIN=stable
	# cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	arch-meson build
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# cargo build --frozen --release --all-features
	meson compile -C build
}

package() {
	cd "$pkgname-$pkgver"
	# install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	meson install -C build --destdir "${pkgdir}"
}

