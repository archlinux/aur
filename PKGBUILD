# Maintainer: Alison Watson <marrub@greyserv.net>
_srcname=angrylion-rdp-plus
pkgname=mupen64plus-video-angrylion-plus-git
pkgver=670.2e72a6c
pkgrel=1
pkgdesc="A low-level N64 video emulation plugin, based on the pixel-perfect angrylion RDP plugin with some improvements."
arch=('i686' 'x86_64')
url="https://github.com/ata4/${_srcname}"
license=('custom:MAME')
depends=('mupen64plus' 'glut')
makedepends=('git' 'mesa' 'glibc' 'cmake' 'boost')
source=("git+https://github.com/ata4/${_srcname}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_srcname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${srcdir}/${_srcname}"
	cmake CMakeLists.txt
	make
}

package() {
	cd "${srcdir}/${_srcname}"
	install -Dm644 "mupen64plus-video-angrylion-plus.so" "${pkgdir}/usr/lib/mupen64plus/mupen64plus-video-angrylion-plus.so"
}
