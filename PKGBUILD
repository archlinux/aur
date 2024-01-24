# Maintainer: Caleb Maclennan <caleb@alerque.com>

# I saw upstream "closed" the Linux support issue and made the code repository
# public and open sourced it, so I thought "Yay"!. It turns out that was
# premature. The issue actually just got migrated and the source is open but
# still macOS only (builds with Xcode and targets Metal for the UI). So this
# package isn't going to work yet. That being said now that the source is
# public I kind of expect it won't take the community *so very long* to help
# port it to other platforms. As such I'll leave this up and keep working on it
# for when that actually happens. PKGREL=0 because not-yet-functional.

pkgname=zed-editor
pkgver=0.119.17
pkgrel=0
pkgdesc='high-performance, multiplayer code editor from the creators of Atom and Tree-sitter'
arch=(x86_64)
url=https://zed.dev
_url="https://github.com/zed-industries/zed"
license=(GPL-3.0-only Apache)
depends=()
makedepends=(cargo
             clang)
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
