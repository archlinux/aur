# Maintainer: éclairevoyant
# Contributor: Will Elliott <troutcobbler at gmail dot com>

pkgname=eww
pkgver=0.5.0
pkgrel=2
pkgdesc="Standalone widget system made in Rust"
url='https://github.com/elkowar/eww'
arch=(x86_64)
license=(MIT)
makedepends=(cargo git)
depends=(gtk3 gtk-layer-shell)
provides=(eww)
conflicts=(eww)
install=$pkgname.install
source=("git+$url?signed#commit=387d344690903949121040f8a892f946e323c472")
b2sums=('SKIP')
validpgpkeys=(
	'9EFD181455D31DD0F42DA932862BA3D7D7760F13' # Leon Kowarschick <5300871+elkowar@users.noreply.github.com>
	'968479A1AFF927E37D1A566BB5690EEEBB952194' # GitHub (web-flow commit signing) <noreply@github.com>
)

prepare() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd $pkgname
	install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -vd "$pkgdir/etc/xdg/$pkgname/"
	cp -vr examples/eww-bar "$pkgdir/etc/xdg/$pkgname/"
	install -vDm755 target/release/$pkgname -t "$pkgdir/usr/bin/"
}
