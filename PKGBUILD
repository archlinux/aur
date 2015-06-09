# Maintainer: ajs124 < aur AT ajs124 DOT de >

pkgname=orderoftwilight
pkgver=1
pkgrel=3
pkgdesc="a game where you use your arrow keys to cast a number of different spells"
arch=('any')
url="http://blog.stabyourself.net/post/33229884169/new-game-order-of-twilight"
license=('CCPL:by-nc-sa')
depends=('love08')
_gamepkg="${pkgname}.zip"
source=(${pkgname}.sh
	${pkgname}.desktop
	${_gamepkg}::http://games.mylittlegamejam.com/game/download/source/39)
sha256sums=('c2a1a1661fb1885c29cd01dd5785cd146b037eb52bc334b7b74fd1b52b0ae55b'
            '525028059749e51613b8ac04340214dd60a0ca80df01c5eda37e9f6c182b1d1b'
            'a0658152cf8ceaeda725e05bf73a19f615a788a395eaba3463bff6bc38ea3c12')

build() {
	mkdir -p temp
    cd temp
    bsdtar -xvf "${srcdir}/Order_of_Twilight.love"
	sed -i 's/math.mod/math.fmod/g' *.lua
	bsdtar -cv --format zip -f ../temp.zip *
	cd ..
	mv -v temp.zip "${srcdir}/Order_of_Twilight.love"
}

package() {
	# Install Data
	install -D -m755 "${srcdir}/Order_of_Twilight.love" "${pkgdir}/usr/share/games/${pkgname}/${pkgname}.love"

	# Install Launcher
	install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	# Install Desktop
	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
