# Maintainer: Alexandre Bouvier <contact@amb.tf>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libretro-beetle-saturn
pkgname=$_pkgname-git
pkgver=r590.ee5b214
pkgrel=1
epoch=1
pkgdesc="Sega Saturn core"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/libretro/beetle-saturn-libretro"
license=('GPL2')
groups=('libretro')
depends=('gcc-libs' 'libretro-core-info')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	make -C $_pkgname
}

package() {
	# shellcheck disable=SC2154
	make -C $_pkgname DESTDIR="$pkgdir" install
}
