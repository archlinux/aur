# Maintainer: Engdyn <aur cat engdyn dog de>
pkgname=libretro-potator-git
pkgver=r98.227c5f6
pkgrel=1
pkgdesc="Watara Supervision core"
arch=(x86_64)
url="https://github.com/libretro/potator"
license=(Unlicense)
groups=(libretro)
depends=(
	libretro-core-info
)
makedepends=(
	git
	make
)
options=(!debug !lto)
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
	cd "$srcdir/${pkgname%-git}/platform/libretro"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 platform/libretro/potator_libretro.so -t "$pkgdir/usr/lib/libretro"
}
