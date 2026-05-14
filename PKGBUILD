# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=src3s
_pkgname=music
_appname=radii5
pkgname=${_appname}-bin
pkgdesc="CLI music downloader powered by yt-dlp with parallel chunk downloading and automatic ID3 tagging"

pkgver=1.0.0
pkgrel=4
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
sha256sums=('cb77c98e3a901d04d641b0afb16d4ddda1dd75ec54e4c9a9450b13352a1c56db'
            '9627c457ca1df2d8ddf7f6400d98854eb1e47476998abd01ad40160e162c8ad5')
sha256sums_x86_64=('07ba070f3091a5779b0525eec2870a35e1682443a08a0ab5afa6e6d3a52ded3d')
sha256sums_aarch64=('198fef730650b7fb10106aa87960a58da3bdb1c4d216353b7325bfad5e1a64b4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
