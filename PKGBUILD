# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=hannah
pkgver=2.0
pkgrel=1
pkgdesc='Help Hannahs Horse Its Pacman with ghosts, music and powerups. And carrots.'
url='https://retrojunkies.co.uk/welsh/home/index/91'
license=('GPL3')
arch=('x86_64' 'aarch64')
conflicts=(${pkgname}-svn)
depends=('sdl2' 'sdl2_ttf' 'sdl2_image' 'sdl2_mixer')
makedepends=('tar' 'make' 'gcc') 
source=("https://master.dl.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('604d799d0f521b917207aaa499eba6faec2f1bcce856ef37811640fb851d2f5a903fbd44415a5fa21dc015eb6b8a0b7b499d458824429405b3f83575848ab3e8')

prepare() {
	cd ${srcdir}"/"${pkgname}"-"${pkgver}
	./configure 
}

build() {
	cd ${srcdir}"/"${pkgname}"-"${pkgver}
	make
}

package() {
	install -dm755 "${pkgdir}/usr/local/share/${pkgname}/resources/"
	install -dm755 "${pkgdir}/usr/bin/"
	cd ${srcdir}"/"${pkgname}"-"${pkgver}
	mv ${pkgname}	${pkgdir}/usr/bin/
	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cp -r resources/* "${pkgdir}/usr/local/share/${pkgname}/resources/" 
}
