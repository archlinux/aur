# Maintainer: Amodio <jacques@boscq.fr>
pkgname=labar
pkgver=1.3.3
pkgrel=1
pkgdesc='Launch bar for Wayland'
arch=('x86_64' 'aarch64' 'riscv64' 'mips64el' 'ppc64le')
url='https://github.com/Amodio/labar'
license=('GPL-3.0-or-later')
depends=(
	glibc
	librsvg
	alsa-lib
	wayland
	glib2
	cairo
	gtk4
)
makedepends=(
	meson
	clang
	cmake
	scdoc
	wayland-protocols
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('069f92a938fe6006fd29ca5545c0fbae963ba6e23bcf795e76405c4572632f05')

build() {
	CC=clang arch-meson "$pkgname-$pkgver" build -Db_sanitize=none -Db_lundef=false
	meson compile -C build
}

package() {
	meson install -C build --no-rebuild --destdir "$pkgdir"
	install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
