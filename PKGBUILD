# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=zed-editor
pkgver=0.119.17
pkgrel=0
pkgdesc='high-performance, multiplayer code editor from the creators of Atom and Tree-sitter'
arch=(x86_64)
url=https://zed.dev
_url="https://github.com/zed-industries/zed"
license=(GPL-3.0-only Apache)
depends=(glibc
         gcc-libs)
makedepends=(cargo)
options=('!lto')
_archive="zed-$pkgver"
source=("$_url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('754f19868f35bffe86edd2c4fa9a39fff33d72c2f47eb5ade445e3fc8f060251')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --all-features
}

package() {
	cd "$_archive"
}
