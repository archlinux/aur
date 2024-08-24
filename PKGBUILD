# Maintainer: Adriik <adriik[dot]linux[at]proton.me>

pkgname=wlsplit
pkgver=0.1.0
pkgrel=1
pkgdesc='Basic speedrun timer for Wayland compositors using wlr-layer-shell'
arch=('i686' 'x86_64')
url='https://github.com/junglerobba/wlsplit'
license=('MIT')
depends=('freetype2' 'fontconfig')
makedepends=('cargo' 'git')
source=("git+https://github.com/junglerobba/wlsplit.git")
md5sums=('SKIP')

prepare() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd $pkgname
	install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/wlsplitctl" -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
