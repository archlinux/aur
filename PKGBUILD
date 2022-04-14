# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
_pkgname=libretro-cap32
pkgname=$_pkgname-git
pkgver=4.5.3.r1.gef0ee89
pkgrel=1
epoch=1
pkgdesc="Amstrad CPC core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/libretro-cap32"
license=('GPL2')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	sed -i 's/-O[0123s]//;s/-Ofast//' $_pkgname/Makefile
}

build() {
	make -C $_pkgname
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro $_pkgname/cap32_libretro.so
}
