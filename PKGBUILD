# Maintainer: Alexandre Bouvier <contact@amb.tf>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libretro-beetle-saturn
pkgname=$_pkgname-git
pkgver=r499.1fee984
pkgrel=1
epoch=1
pkgdesc="Standalone port of Mednafen Saturn to the libretro API"
arch=('x86_64' 'i686')
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
	cd $_pkgname
	make
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	make DESTDIR="$pkgdir" install
}
