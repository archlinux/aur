# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ih8d8
_gitname=yt-dlp-manager
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Self-hosted yt-dlp download manager: Web UI, TUI and CLI over one shared queue"

pkgver=0.4.0
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
sha256sums=('c1d17de3b713d5c4b9e10b3e2514a5f688e0888993a335440c678c50ed415a98'
            '426634662573d640259eb5c91df92344c36589556017ce870c84f9a787888153')
sha256sums_x86_64=('88d075ff7181347b15cbbfb80cebbb9c607f3b84f3a963980ab827908a3a9928')
sha256sums_aarch64=('0c5b75956fdd21cd6d1b45a6e6bb2ec0ff50dfd5d011e8d92c42e7929c6cfb61')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
