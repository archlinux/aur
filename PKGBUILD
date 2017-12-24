# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
pkgname=microsip
pkgver=3.16.7
pkgrel=2
pkgdesc="Open source portable SIP softphone for Windows based on PJSIP stack"
arch=('x86_64')
url="https://www.microsip.org/"
license=('GPLv2')
depends=('wine' 'lib32-libpulse')
makedepends=('icoutils' 'imagemagick')

source=("MicroSIP-${pkgver}.zip"::"https://www.microsip.org/downloads/?file=MicroSIP-${pkgver}.zip"
		"${pkgname}"
		"${pkgname}.desktop")

sha256sums=('a68cf6b1e49e24c1ad808e98b90e129a0280f57af4602b752b76b88621ea313c'
            '42969a2fbc22b436f6ade3d496aafc7ec9c2d36b4e5867f793a5e35560757e66'
            'd588c2b2e38e12d2be3dfdd9f2a63690293b884c7df240c441e271725b9a2ca2')

prepare() {
	cd "${srcdir}"

	wrestool -x -t 14 microsip.exe >${pkgname}.ico
	convert ${pkgname}.ico ${pkgname}.png
	mv ${pkgname}-0.png ${pkgname}.png
}

package() {
	cd "${srcdir}"

	install -Dt "${pkgdir}/usr/share/doc/${pkgname}" -m0644 "License.txt"
	install -Dt "${pkgdir}/usr/share/doc/${pkgname}" -m0644 "MicroSIP Website.url"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "hangup.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "messagein.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "messageout.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "ringin.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "ringin2.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "ringout.wav"
	install -Dt "${pkgdir}/usr/lib/${pkgname}" -m0644 "SDL.dll"
	install -Dt "${pkgdir}/usr/lib/${pkgname}" -m0644 "avcodec-57.dll"
	install -Dt "${pkgdir}/usr/lib/${pkgname}" -m0644 "avformat-57.dll"
	install -Dt "${pkgdir}/usr/lib/${pkgname}" -m0644 "avutil-55.dll"
	install -Dt "${pkgdir}/usr/lib/${pkgname}" -m0644 "microsip.exe"
	install -Dt "${pkgdir}/usr/lib/${pkgname}" -m0644 "swscale-4.dll"

	install -Dt "${pkgdir}/usr/bin" -m0755 "${pkgname}"
	install -Dt "${pkgdir}/usr/share/applications" -m0644 "${pkgname}.desktop"
	install -Dt "${pkgdir}/usr/share/icons/hicolor/48x48/apps" -m0644 "${pkgname}.png"
}

