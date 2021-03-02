# Maintainer: Alexandre Bouvier <contact@amb.tf>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libretro-genesis-plus-gx-wide
pkgname=$_pkgname-git
pkgver=r1530.fbbac38
pkgrel=1
pkgdesc="Widescreen modification of Genesis Plus GX"
arch=('x86_64')
url="https://github.com/libretro/Genesis-Plus-GX-Wide"
license=('custom')
groups=('libretro')
depends=('libretro-core-info' 'glibc')
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
	make -f Makefile.libretro
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro genesis_plus_gx_wide_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname LICENSE.txt
}
