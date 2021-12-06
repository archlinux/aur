# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-beetle-saturn
pkgname=$_pkgname-git
pkgver=r608.e6ba71f
pkgrel=1
pkgdesc="Sega Saturn core"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/libretro/beetle-saturn-libretro"
license=('GPL2')
groups=('libretro')
depends=('gcc-libs' 'libretro-core-info')
makedepends=('git' 'libchdr')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	sed -i 's/-O2//' $_pkgname/Makefile
}

build() {
	make -C $_pkgname SYSTEM_LIBCHDR=1
}

package() {
	depends+=('libchdr.so')
	# shellcheck disable=SC2154
	make -C $_pkgname DESTDIR="$pkgdir" install
}
