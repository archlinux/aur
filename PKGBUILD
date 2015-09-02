# Maintainer: Ainola
# Contributor: Pio

pkgname=mrrescue
pkgver=1.02c
pkgrel=2
pkgdesc="An arcade styled 2d action game centered around evacuating civilians from burning buildings."
arch=('any')
url="http://tangramgames.dk/games/mrrescue/"
license=('CCPL:by-sa' 'zlib')
depends=('love')
makedepends=('gendesk')
source=("https://github.com/SimonLarsen/mrrescue/releases/download/v${pkgver}/${pkgname}-${pkgver}.love")
md5sums=('85897f04f2e9c3aaded74bf178aeab4c')

build() {
	# Generate desktop file
	cd "${srcdir}"
	gendesk -n

	# Generate run script
	echo -e "#!/bin/sh\nlove /usr/share/mrrescue/mrrescue-${pkgver}.love" > "${pkgname}.sh"
}

package() {
	# Copy game and license
	cd "${srcdir}" #/${pkgname}-${pkgver}-love"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${pkgname}-${pkgver}.love" "${pkgdir}/usr/share/${pkgname}/${pkgname}-${pkgver}.love"
	# Extract an image to be used as icon
	unzip -p "${pkgname}-${pkgver}.love" data/splash.png > mrrescue.png
	# Copy desktop file, icon and run script
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -D "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
