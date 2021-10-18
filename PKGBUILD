# Maintainer: Autumn Boyhan <autumn@crisismodel.com>

pkgname=retux
pkgver=1.6
pkgrel=2
pkgdesc="ReTux is a libre open source action platformer loosely inspired by the Mario games, utilizing the art assets from the SuperTux project."
arch=('x86_64')
url="https://retux-game.github.io/"
license=('GPL3')
depends=('python' 'python-sge' 'python-xsge')
provides=('retux')
conflicts=('retux' 'retux-bin')
_name=${pkgname#python-}
source=("https://github.com/retux-game/retux/releases/download/v${pkgver}/${pkgname}-${pkgver}-src.zip"
        "${pkgname}.desktop"
	"${pkgname}.sh")
md5sums=('0696719cc65b4fc3f58037028aa8c9be'
         '8e2937a7627804a6a079a9cce4dda3fa'
         'a8273ca35254ba6394cbd5f2ff55c2e5')

noextract=("${pkgname}-${pkgver}-src.zip")

prepare() {
	unzip ${srcdir}/${pkgname}-${pkgver}-src.zip
	mv ${srcdir}/${pkgname}-${pkgver}-src ${srcdir}/${pkgname}
}

package() {
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/icons
	cp -R ${srcdir}/${pkgname} ${pkgdir}/usr/share
	cp ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
	chmod +x ${pkgdir}/usr/bin/${pkgname}
	cp ${pkgdir}/usr/share/${pkgname}/data/images/misc/icon.png \
		${pkgdir}/usr/share/icons
	mv ${pkgdir}/usr/share/icons/icon.png ${pkgdir}/usr/share/icons/retux.png
	cp retux.desktop ${pkgdir}/usr/share/applications
}
