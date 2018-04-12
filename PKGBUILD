# Maintainer: Benjamin Hodgetts <ben@xnode.org>

_libname=frodo_libretro
_gitname=frodo-libretro
pkgname=libretro-frodo-ex-git
pkgver=r156.4c15016
pkgrel=1
pkgdesc="Frodo libretro core (Commodore 64/C64)."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/r-type/frodo-libretro"
license=('GPL2')
groups=('libretro')
provides=('libretro-frodo')
conflicts=('libretro-frodo')
depends=('zlib' 'libretro-core-info')
makedepends=('git')
source=("git+https://github.com/r-type/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_gitname}
	make -f Makefile.libretro
}

package() {
	install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
