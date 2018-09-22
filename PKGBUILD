# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
pkgname=microsip
pkgver=3.19.7
pkgrel=4
pkgdesc="Open source portable SIP softphone for Windows based on PJSIP stack"
arch=(x86_64)
url="https://www.microsip.org/"
license=(GPLv2)
depends=(wine lib32-libpulse lib32-gnutls xorg-xdpyinfo)
makedepends=(icoutils imagemagick)
install=${pkgname}.install

source=("MicroSIP-${pkgver}.zip"::"https://www.microsip.org/downloads/?file=MicroSIP-${pkgver}.zip"
		"${pkgname}"
		"${pkgname}.desktop"
		"${pkgname}.reg")

sha256sums=('3ccf07e88d727681eb338aeb3420b324b5bf614e672bf60e3705137b43fd09bd'
            '63175e29172a06ab6f2474fc03a1c464ef2e6367d0c704e17d437cc4a9ca69d0'
            'd588c2b2e38e12d2be3dfdd9f2a63690293b884c7df240c441e271725b9a2ca2'
            'c97cde99004dbee5cb9b05a7b6bad117e5ec63cb1032fa56efdf07a4b27e3c1d')

prepare() {
	wrestool -x -t 14 microsip.exe >${pkgname}.ico
	convert ${pkgname}.ico ${pkgname}.png

	mv ${pkgname}-0.png ${pkgname}.png
}

package() {
	install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m0644 "License.txt"
	install -Dt "${pkgdir}/usr/share/doc/${pkgname}" -m0644 "MicroSIP Website.url"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "hangup.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "messagein.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "messageout.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "ringin.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "ringin2.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "ringout.wav"
	install -Dt "${pkgdir}/usr/lib/${pkgname}" -m0644 "SDL2.dll"
	install -Dt "${pkgdir}/usr/lib/${pkgname}" -m0644 "avcodec-57.dll"
	install -Dt "${pkgdir}/usr/lib/${pkgname}" -m0644 "avformat-57.dll"
	install -Dt "${pkgdir}/usr/lib/${pkgname}" -m0644 "avutil-55.dll"
	install -Dt "${pkgdir}/usr/lib/${pkgname}" -m0644 "microsip.exe"
	install -Dt "${pkgdir}/usr/lib/${pkgname}" -m0644 "swscale-4.dll"

	install -Dt "${pkgdir}/usr/bin" -m0755 "${pkgname}"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "${pkgname}.reg"
	install -Dt "${pkgdir}/usr/share/applications" -m0644 "${pkgname}.desktop"
	install -Dt "${pkgdir}/usr/share/icons/hicolor/48x48/apps" -m0644 "${pkgname}.png"
}

