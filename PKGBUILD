# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=yutat23
_gitname=lsoff
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="CLI / TUI that lists listening TCP/UDP ports"

pkgver=0.1.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('6bfac464becfe24703bc557b0976067d2501a83e7d1a8419fd00fe201137fa31'
            '8fa6650c7c9bea4113c2981b4859e8b547ef5ceae3747d5aa3f5d2d7e6a5bad1')
sha256sums_x86_64=('f1fc6300703fdd08be355b9fc957ed6867827678abe6ebec9746be612cdb1e14')
sha256sums_aarch64=('a7840e153b099addaac4fe6196b2bad053257d9e6c2ad18fa123eb19e66e18c8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
