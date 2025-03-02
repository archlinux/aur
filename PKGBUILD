# Maintainer: Stanislav T <stas-t@gmx.com>
pkgname=descent3-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Descent 3 Open Source game engine (prebuilt)"
arch=('x86_64')
url="https://github.com/DescentDevelopers/$pkgname"
license=('GPL-3.0-or-later')
depends=('sdl2' 'zlib')
makedepends=('imagemagick')
provides=("descent3")
conflicts=("descent3")
source=(
	https://github.com/DescentDevelopers/Descent3/releases/download/v${pkgver}/Descent3_Release_Linux-x64.zip
	descent3.sh
	Descent3.desktop
	https://raw.githubusercontent.com/DescentDevelopers/Descent3/refs/heads/main/Descent3/Descent3.ico
)
noextract=("Descent3.ico")
sha256sums=('0c62f6d8f0f569f1a1edcb825dffdbfff785ec28ecd242d1d0f5d0b08496e78a'
            '16ed839e33262582e2baaa5a9844323f9dd0e28606cf5698c6f17348dd8e0fdc'
            '9f74eb7a541697dea58c423d1db42c74ecfe242b72b00ac57b3c4e5623b84eec'
            '2e2ef7b3e62c9411a7f734715a307b29b9af009a7e60c2b40e0587cd86c3c69f')

prepare () {
	magick Descent3.ico Descent3.png
}

package() {

	install -d -m 755 "${pkgdir}/usr/lib/descent3"
	install -Dm 755 -t "${pkgdir}/usr/lib/descent3" Descent3 
	install -Dm 755 -t "${pkgdir}/usr/lib/descent3" d3-linux.hog
	install -Dm 644 -t "${pkgdir}/usr/share/applications" "${srcdir}/Descent3.desktop"
	install -Dm 644 -t "${pkgdir}/usr/share/icons" "${srcdir}/Descent3.png"
	install -Dm 755 "${srcdir}/descent3.sh" "${pkgdir}/usr/bin/descent3"
	# install some extras
	install -d -m 755 "${pkgdir}/usr/lib/descent3/online"
	find online -type f -exec install -Dm 644 -t "${pkgdir}/usr/lib/descent3/online" "{}" \;
	install -d -m 755 "${pkgdir}/usr/lib/descent3/netgames"
	find netgames -type f -exec install -Dm 644 -t "${pkgdir}/usr/lib/descent3/netgames" "{}" \;
	# install documentation
	install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" USAGE.md
}
