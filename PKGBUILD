# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=bjarneo
_pkgname=cliamp
pkgname=${_pkgname}-bin
pkgdesc="A retro terminal music player inspired by Winamp 2.x"

pkgver=1.63.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

depends=('glibc' 'libgcc' 'ffmpeg' 'yt-dlp' 'flac' 'alsa-lib' 'libvorbis' 'libogg')

source=("LAUNCHER-${pkgver}.desktop::${_urlraw}/${_pkgname}.desktop"
		"ICON-${pkgver}.png::${_urlraw}/${_pkgname^}.png"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('3e2af63bbd6ddfbee31f2312a82d39d56bb332d209f2593450a4c93194386ebe'
            '8b68d5696b993879188c401843472ee53335ad6710be11944d0fe43bbd8e4787'
            '57764ebae827c1c96dc5c1b74e2579ff34d3abcaabb54f5e5498fb2f612330cc'
            '44b826a32e2c07e956434dbb39d559a61b32752b551a5d3ef5b9111777a9f7e1')
sha256sums_x86_64=('b066832c84cb9dffcb126252dedb55a0ebcd13cbac95bbff103b111b88ce17c9')
sha256sums_aarch64=('3be4ebe8806d2432b58afedd0fbdcb9522266b0204ab6cddb7f519f6ee33a8aa')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LAUNCHER-${pkgver}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "ICON-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
	install -Dm644 "ICON-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
