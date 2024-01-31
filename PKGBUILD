# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-reminiscence
pkgname=$_pkgname-git
pkgver=r88.e218569
pkgrel=1
pkgdesc="Flashback engine core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/REminiscence"
license=('GPL-3.0-only')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	sed -i 's/-O[0123s]//' $_pkgname/Makefile
}

build() {
	make -C $_pkgname
}

package() {
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro $_pkgname/reminiscence_libretro.so
}
