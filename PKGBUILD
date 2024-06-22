# Maintainer: stein.cadwal@proton.me
pkgname=vterm-git
pkgver=r14.c6a6db1
pkgrel=1
pkgdesc="A cross platform, vulkan terminal emulator written in rust (git development version)"
arch=('x86_64')
url="https://github.com/nuIIpointerexception/vterm"
license=('MPL-2.0')
depends=(
	"gcc-libs"
	"glibc"
)
makedepends=(
	"git"
	"cargo"
	"rustup"
	"vulkan-headers"
	"just"
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname}"
	rustup override set nightly
}

build() {
	cd "$srcdir/${pkgname}"
	cargo build --release
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/vterm"
	install -Dm644 "assets/linux/vterm.desktop" "$pkgdir/usr/share/applications/vterm.desktop"
}
