# Maintainer: Autumn Boyhan <autumn@crisismodel.com>

pkgname=retux-bin
_pkgname=retux
pkgver=1.4.1
_pkgver=1.4.1-1
pkgrel=1
pkgdesc="ReTux is a libre open source action platformer loosely inspired by the Mario games, utilizing the art assets from the SuperTux project."
arch=('x86_64')
url="https://retux-game.github.io/"
license=('GPL3')
depends=('sdl' 'sdl_image' 'sdl_mixer')
provides=('retux')
conflicts=('retux')
source=("https://github.com/retux-game/retux/releases/download/v${_pkgver}/${_pkgname}-${pkgver}-linux-${arch}.tar.gz"
        "${_pkgname}.desktop"
	"${_pkgname}.sh")
md5sums=('e057883666816933c3b4f2c519bff0b8'
         '4ea890841ed39987403ca2180813c4bb'
         'f9476ed7be634401040daaf9711b96f5')

noextract=("${_pkgname}-${pkgver}-linux-${arch}.tar.gz")

prepare() {
	tar -xf ${srcdir}/${_pkgname}-${pkgver}-linux-${arch}.tar.gz
	mv ${srcdir}/${_pkgname}-${pkgver}-linux-${arch} ${srcdir}/${_pkgname}
}

package() {
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/icons
	cp -R ${srcdir}/${_pkgname} ${pkgdir}/usr/share
	cp ${srcdir}/${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
	chmod +x ${pkgdir}/usr/bin/${_pkgname}
	cp ${pkgdir}/usr/share/${_pkgname}/data/images/misc/icon.png \
		${pkgdir}/usr/share/icons
	mv ${pkgdir}/usr/share/icons/icon.png ${pkgdir}/usr/share/icons/retux.png
	cp retux.desktop ${pkgdir}/usr/share/applications
}
