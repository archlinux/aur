# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=bjarneo
_pkgname=cliamp
pkgname=${_pkgname}-bin
pkgdesc="A retro terminal music player inspired by Winamp 2.x"

pkgver=1.62.0
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
            '4df77c738e019293c69582f726dd8bd8edb57f453df9bfbecd72ddd34acd6c13')
sha256sums_x86_64=('96a97ddce6219b41d221278392792e552502f2108e48d417784b7d4d366ee467')
sha256sums_aarch64=('0e9bb20a42ed950353e5149f81d1e3c4bd1af5f2d0cf53f0ca2d95e71542bf77')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LAUNCHER-${pkgver}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "ICON-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
	install -Dm644 "ICON-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
