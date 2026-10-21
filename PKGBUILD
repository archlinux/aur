# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=hkdb
_gitname=otui
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="An opinionated, 'speed' and 'usability' focused agentic TUI with a built-in MCP registry/plugin system"

pkgver=0.09.00
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"KEYBINDINGS-${pkgver}.md::${_ghurlraw}/docs/KEYBINDINGS.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}")
sha256sums=('7591b71f73dbefdb6a64370a9e165f8ec3510348c4bce3aabd4a3e6963d771fb'
            '54804b646942cb43596d288c7cec31b57ffcc8bb38b67afecb77958f305c1693'
            'da2db9d0656a402bb64c5f8717ea271099dcff12d35f70515d9c811f2db836e9')
sha256sums_x86_64=('9801235f6ab238c246c88d94a606fd074174b37e65cbc15d48ef74cb5bfc2528')
sha256sums_aarch64=('5a085abbd5df699e61a72664908a78faf62bd4360b7507bab288cf3f436109c0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "KEYBINDINGS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/KEYBINDINGS.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
