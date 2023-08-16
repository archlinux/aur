# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
_pkgname=libretro-beetle-cygne
pkgname=$_pkgname-git
pkgver=893.a0ddcd3
pkgrel=1
epoch=1
pkgdesc="WonderSwan/Color libretro core"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/beetle-wswan-libretro"
license=('GPL2')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")

_libname=mednafen_wswan_libretro
_gitname=beetle-wswan-libretro
source=("git+https://github.com/libretro/${_gitname}.git")
b2sums=('SKIP')

pkgver() {
	cd ${_gitname}
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${_gitname}"
	make
}

package() {
	install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
