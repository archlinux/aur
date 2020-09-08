# Maintainer: Autumn Boyhan <autumn@crisismodel.com>
# Contributor: Gabriel Moura <develop@srmoura.com.br>

pkgname=retux-bin
_pkgname=retux
pkgver=1.4
pkgrel=1
pkgdesc="ReTux is a libre open source action platformer loosely inspired by the Mario games, utilizing the art assets from the SuperTux project."
arch=('x86_64')
url="https://retux-game.github.io/"
license=('GPL3')
depends=('python' 'python-pygame')
provides=('retux')
conflicts=('retux')
source=("https://github.com/retux-game/retux/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-${arch}.tar.gz"
        "${_pkgname}.desktop")
md5sums=('0dac718ccc5750ff9107b5b04e43f4bc'
         '93ea709ea729e680b0ee7577b74df76a')

noextract=("${_pkgname}-${pkgver}-linux-${arch}.tar.gz")

prepare() {
	tar -xf ${srcdir}/${_pkgname}-${pkgver}-linux-${arch}.tar.gz
	mv ${srcdir}/${_pkgname}-${pkgver}-linux-${arch} ${_pkgname}
}

package() {
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/icons
	cp -R ${srcdir}/${_pkgname} ${pkgdir}/usr/share
	ln -s /usr/share/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
	cp ${pkgdir}/usr/share/${_pkgname}/data/images/misc/icon.png \
		${pkgdir}/usr/share/icons
	mv ${pkgdir}/usr/share/icons/icon.png ${pkgdir}/usr/share/icons/retux.png
	cp retux.desktop ${pkgdir}/usr/share/applications
}
