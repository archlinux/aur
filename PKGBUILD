# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
_pkgname=lxdream
pkgname=${_pkgname}-git
pkgver=r1315.82661a5
pkgrel=1
pkgdesc='A linux-based emulator for the Sega Dreamcast system'
arch=('i686' 'x86_64')
url='http://www.lxdream.org/'
license=('GPL')
depends=('gtk2' 'libgl' 'libisofs' 'sdl')
makedepends=('git')
optdepends=('lirc-utils')
conflicts=('lxdream')
install='lxdream.install'
options=('!makeflags')
source=("git+https://github.com/${_pkgname}/${_pkgname}.git"
        'lxdream.install')
md5sums=('SKIP'
         '93c7ce3ab727ccdf79569bc520b3d7a1')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${srcdir}/${_pkgname}"

	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--enable-shared \
		--with-gtk \
		--with-sdl \
		--without-osmesa \
		--without-esd \
		--without-pulse
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}/" install
}
