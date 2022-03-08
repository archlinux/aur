# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
_pkgname=libretro-cap32
pkgname=$_pkgname-git
pkgver=r291.408da09
pkgrel=1
epoch=1
pkgdesc="Amstrad CPC core"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/libretro/$_pkgname"
license=('GPL2')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	make -C $_pkgname
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro $_pkgname/cap32_libretro.so
}
