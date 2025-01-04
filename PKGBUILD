# Maintainer: Sebaguardian <sebaguardian13@gmail.com>
# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=arnis
pkgver=2.1.1.1
_pkgver='2.1.1-tweak_uno'
pkgrel=1
pkgdesc='Generate any location from the real world in Minecraft'
arch=('x86_64')
url="https://github.com/louis-e/$pkgname"
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::https://github.com/louis-e/$pkgname/archive/refs/tags/v$_pkgver.tar.gz")
md5sums=('4287e5eca22b8f57bfb859c6dd3785e1')
makedepends=('cargo')
depends=('gtk3' 'webkit2gtk-4.1' 'libsoup3' 'cairo' 'gcc-libs' 'glibc' 'openssl' 'glib2' 'gdk-pixbuf2')

prepare() {
	cd "$pkgname-$_pkgver"
	export RUSTUP_TOOLCHAIN=stable
    # cargo fetch --frozen --target "$(rustc -vV | sed -n 's/host: //p')"
	cargo fetch
}

build() {
	cd "$pkgname-$_pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release # --frozen
}

package() { 
	cd "$pkgname-$_pkgver"
	install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
