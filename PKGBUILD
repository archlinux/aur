# Maintainer: Amodio <jacques@boscq.fr>
pkgname=labar
pkgver=1.3.3
pkgrel=0
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
	cmake
	scdoc
	wayland-protocols
)
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('069f92a938fe6006fd29ca5545c0fbae963ba6e23bcf795e76405c4572632f05')

build() {
	arch-meson "$pkgname-$pkgver" build --buildtype=release -Db_sanitize=none
	meson compile -C build
}

package() {
	meson install -C build --no-rebuild --destdir "$pkgdir"
	install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
