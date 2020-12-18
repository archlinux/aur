# Maintainer: Ryan Farley <ryan.farley@gmx.com>

pkgname=rcfvt-git
pkgver=r52.4ac15e8
pkgrel=1
pkgdesc="my own crappy terminal emulator"
arch=(x86_64 armv7h)
url="https://github.com/r-c-f/rcfvt"
license=('MIT')
depends=(vte3)
makedepends=(git meson ninja libcanberra libnotify)
optdepends=('libcanberra: audible bell with standard sound card output' 'libnotify: send notifications on bell')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/r-c-f/rcfvt.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	arch-meson build
	cd build
	ninja
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	DESTDIR="$pkgdir" ninja install
	install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
