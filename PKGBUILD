# Maintainer: stein.cadwal@proton.me
pkgname=vterm-git
pkgver=r6.0dee7de
pkgrel=1
pkgdesc="A cross platform, vulkan terminal emulator written in rust (git development version)"
arch=('x86_64')
url="https://github.com/nuIIpointerexception/vterm"
license=('MIT')
depends=(
	"vulkan-icd-loader"
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
	rustup override set nightly
}

build() {
	cd "$srcdir/${pkgname}"
	just build
}

check() {
	cd "$srcdir/${pkgname}"
	just test
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/x86_64-unknown-linux-gnu/release/vterm"
	# install -Dm644 "extra/linux/Vterm.desktop" "$pkgdir/usr/share/applications/vterm.desktop"
}
