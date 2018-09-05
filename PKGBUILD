# Maintainer: Mike Polvere <mic.tjs@gmail.com>

pkgname=libretro-dinothawr-git
pkgver=469.92431d1
pkgrel=1
pkgdesc="Block pushing puzzle game on slippery surfaces. Needs a libretro frontend to play."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/Dinothawr"
license=('custom')
depends=('gcc-libs' 'zlib')
makedepends=('git')
_gitname=Dinothawr
_libname=dinothawr_libretro
_libnam1=dinothawr
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  	cd "${_gitname}"
  	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  	cd "${_gitname}"
  	make
}

package() {
	install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  	install -Dm644 "${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  	mkdir -p "${pkgdir}/usr/share/libretro"
  	cp -a "${_gitname}/${_libnam1}" "${pkgdir}/usr/share/libretro/${_libname}"
}
