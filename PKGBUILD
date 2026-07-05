# Maintainer: Engdyn <aur cat engdyn dog de>
pkgname=libretro-sameduck-git
pkgver=r1357.f0286ee
pkgrel=1
pkgdesc="Mega Duck core"
arch=(x86_64 aarch64)
url="https://github.com/libretro/sameduck"
license=(MIT)
groups=(libretro)
depends=(
	libretro-core-info
)
makedepends=(
	git
)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=(
	${pkgname%-git}::git+$url.git
)
sha256sums=(
	SKIP
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}/libretro"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 libretro/sameduck_libretro.so -t "$pkgdir/usr/lib/libretro"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
