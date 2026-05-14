# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=src3s
_pkgname=music
_appname=radii5
pkgname=${_appname}-bin
pkgdesc="CLI music downloader powered by yt-dlp with parallel chunk downloading and automatic ID3 tagging"

pkgver=1.0.0
pkgrel=2
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
sha256sums=('798e6c52e3afece7dd5215ce89133f942d0604cb4b8e1f9543ff7d53d55d4895'
            '9627c457ca1df2d8ddf7f6400d98854eb1e47476998abd01ad40160e162c8ad5')
sha256sums_x86_64=('32005977f7d21f2663201f7c55b9230c8be7c73fd40c46497e8d95c2417616a2')
sha256sums_aarch64=('0c966d022e655849079dd438137ea2176691bd8154515ac1f3624a8e618028d6')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
