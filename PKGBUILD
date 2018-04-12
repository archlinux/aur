# Maintainer: Benjamin Hodgetts <ben@xnode.org>

_gitname=picodrive
_libname=picodrive_libretro
pkgname=libretro-picodrive-ex-git
pkgver=r1188.e2ce06d
pkgrel=1
pkgdesc="Picodrive libretro core (Megadrive/Genesis/Master System/GameGear/CD/32X)."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/picodrive"
license=('CUSTOM')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
provides=('libretro-picodrive')
conflicts=('libretro-picodrive')
makedepends=('git')
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_gitname}"
	git submodule update --init --recursive
}

build() {
	cd "${_gitname}"
	./configure
	make -f Makefile.libretro
}

package() {
	install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
