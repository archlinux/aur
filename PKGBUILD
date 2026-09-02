# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ih8d8
_gitname=yt-dlp-manager
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Self-hosted yt-dlp download manager: Web UI, TUI and CLI over one shared queue"

pkgver=0.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('yt-dlp' 'ffmpeg')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[1]}")
sha256sums=('f55573b4f1a27e5a0363f2c38dbafd7486f647bae586107012faa1a1f13e8a97'
            '426634662573d640259eb5c91df92344c36589556017ce870c84f9a787888153')
sha256sums_x86_64=('cce4b1f4d7f4a79bee5929b6e97c6f523da06af85118da2e2015781c29de3247')
sha256sums_aarch64=('8b1ba88dbb1da34b0da393dadad7844d46f857b4a7844f1107373e917d298e46')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
