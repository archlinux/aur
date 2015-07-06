# Maintainer: pj1031999 <pj1031999@gmail.com> 
# Contributor: Michal Docekal <docekal@gmail.com>
# Contributor: Laurie Clark-Michalek <bluepeppers (at) archlinux (dot) us>
pkgname=block-attack
pkgver=1.4.2
pkgrel=1
arch=('any')
pkgdesc="An open source clone of Tetris Attack based on SDL"
url="http://blockattack.sourceforge.net/"
license="GPL2"
depends=('sdl_mixer' 'sdl_image' 'sdl_ttf')
makedepends=('make' 'enet' 'patch' 'physfs')
source=("http://downloads.sourceforge.net/blockattack/blockattack-${pkgver}.tar.bz2"
				"${pkgname}.patch"
				"${pkgname}.desktop")
md5sums=('f19cc0115d18f8a62a11ba126ad8811b'
				 '9e6d1adfa67b68c5a602b0cb47555f15'
				 '74492de6eb6bdb3095c5c1220d0653d8')

build() {
  install "${srcdir}/${pkgname}.desktop" "${srcdir}/blockattack-${pkgver}/blockattack.desktop"
  cd "${srcdir}/blockattack-${pkgver}/"
  patch Makefile "${srcdir}/${pkgname}.patch"
  make
}

package() {
	cd "${srcdir}/blockattack-${pkgver}/"
	make DESTDIR=${pkgdir} install
}
