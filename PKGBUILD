# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ohcass
_pkgname=radii5
_appname=${_pkgname}
pkgname=${_appname}-bin
pkgdesc="CLI music downloader powered by yt-dlp with parallel chunk downloading and automatic ID3 tagging"

pkgver=0.3.8
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('ffmpeg' 'yt-dlp' 'deno')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}")
sha256sums=('c467c226030ec67c8e8ce6ce21b1fad2ba2f4f9ae1c00a0bd4fdfc234e9a0a9c'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('533e151b1a2cc177fb8a73b4fe00977a3c85488bf7cbc198a46e6829c93cdccc')
sha256sums_aarch64=('1b22f615717b934c07c131ff657fa86e154583f166d60fe024db1f8c3cafa2fd')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
