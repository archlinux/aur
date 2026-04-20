# Maintainer: Amodio <jacques@boscq.fr>
pkgname=labar
pkgver=1.4.1
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
	cmake
	scdoc
	wayland-protocols
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('590317beff5a5578de8796cb103d9c51a1118038d56811a359a2abae4c59ee35')

build() {
	arch-meson "$pkgname-$pkgver" build -Db_sanitize=none
	meson compile -C build
}

package() {
	meson install -C build --no-rebuild --destdir "$pkgdir"
	install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
