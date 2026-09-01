# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ih8d8
_gitname=yt-dlp-manager
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Self-hosted yt-dlp download manager: Web UI, TUI and CLI over one shared queue"

pkgver=0.1.0
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
sha256sums=('38dce672ec5deb387b7b6e0205e7e704b3469e2a02d9b7af6a1db23dd6949078'
            '426634662573d640259eb5c91df92344c36589556017ce870c84f9a787888153')
sha256sums_x86_64=('46873c6704b375408ea0f5ef29693901a2138cdc2c5dcfaab843e5d0d629598a')
sha256sums_aarch64=('33a62bbfd2174e92d36c4d9da97f81f40725d27b57f9e1ff682b75c8a0f1856b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
