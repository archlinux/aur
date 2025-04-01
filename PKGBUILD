# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=wooz-git
pkgver=r1.e221728
pkgrel=1
pkgdesc='zoom / magnifier utility for Wayland'
arch=(x86_64)
url='https://github.com/negrel/wooz'
license=(MIT)
depends=(wayland)
makedepends=(git meson ninja pango wayland-protocols)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	# Git, no tags available
	cd "$srcdir/$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson build $pkgname
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
