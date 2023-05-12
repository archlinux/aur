# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
_pkgname=libretro-mesen
pkgname=$_pkgname-git
pkgver=0.9.9.r282.gd0a48b6d
pkgrel=1
pkgdesc="Nintendo Entertainment System core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://www.mesen.ca/"
license=('GPL3')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/libretro/Mesen.git")
b2sums=('SKIP')

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	sed -i 's/-O[0123s]//;s/-Ofast//' $_pkgname/Libretro/Makefile
}

build() {
	make -C $_pkgname/Libretro LTO=
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro $_pkgname/Libretro/mesen_libretro.so
}
