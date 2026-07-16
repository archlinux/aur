# Maintainer: Engdyn <aur cat engdyn dog de>
pkgname=libretro-uzem-git
pkgver=r77.d4fe82c
pkgrel=1
pkgdesc="Uzebox core"
arch=(x86_64 i686 arm7hf)
url="https://github.com/libretro/libretro-uzem"
license=(MIT)
groups=(libretro)
depends=(
	gcc-libs
	libretro-core-info
)
makedepends=(
	git
)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=(
	${pkgname%-git}::git+$url.git
	LICENSE
)
sha256sums=(
	SKIP
	524047f2ae0f963f4e81c354e0cb726eaaccd23901520206526deac66b124952
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 uzem_libretro.so -t "$pkgdir/usr/lib/libretro"
	install -Dm644 "$srcdir"/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
