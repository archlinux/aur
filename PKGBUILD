# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
_pkgname=libretro-virtualjaguar
pkgname=$_pkgname-git
pkgver=r311.263c979
pkgrel=1
epoch=1
pkgdesc="Atari Jaguar core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/virtualjaguar-libretro"
license=('GPL3')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	sed -i 's/-O[0123s]//;s/-Ofast//' $_pkgname/Makefile
}

build() {
	make -C $_pkgname
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro $_pkgname/virtualjaguar_libretro.so
}
