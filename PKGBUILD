# Maintainer: Jordan Christiansen <xordspar0@gmail.com>

pkgname=gearhead2
_reponame=gearhead-2
pkgver=0.701
pkgrel=1
pkgdesc="A rougelike mecha role playing game, second game in the GearHead series"
arch=(i686 x86_64)
url="http://www.gearheadrpg.com/"
license=('LGPL')
depends=(sdl sdl_image sdl_ttf)
makedepends=(fpc)
source=("https://github.com/jwvhewitt/${_reponame}/archive/v${pkgver}.tar.gz"
		${pkgname}.sh
		${pkgname}.desktop
		${pkgname}.png)
md5sums=('4d556f800b18dcd1287f64b2cd562fb5'
         '713ec01c46263b196ba5dd658248eeed'
         '6d0e194ef934b66fefade9b5d2d5efe1'
         '19f59e008bbe3fdcf39363818d3a5cf1')

build() {
	cd "${_reponame}-${pkgver}"

	fpc -dSDLMODE gearhead2
}

package() {
	cd "${_reponame}-${pkgver}"
	# Install the game data.
	install -d "${pkgdir}/usr/share/${pkgname}"
	cp -ar -t "${pkgdir}/usr/share/${pkgname}" image design gamedata series
	install -Dm755 gearhead2 "${pkgdir}/usr/share/${pkgname}"
	# Install the documentation
	install -d "${pkgdir}/usr/share/doc/${pkgname}"
	cp -ar -t "${pkgdir}/usr/share/doc/${pkgname}" doc

	cd "${srcdir}"
	# Install the command line and desktop runners.
	install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
	# The .desktop file was adapted from Debian's gearhead package.
	install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 ${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
