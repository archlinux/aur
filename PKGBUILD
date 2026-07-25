# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=hkdb
_gitname=otui
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="An opinionated, 'speed' and 'usability' focused agentic TUI with a built-in MCP registry/plugin system"

pkgver=0.08.02
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
            '4021f971ed75e94a5f95f576f85c626effed02fccf0cf7865c1eb5b54ed61772'
            '7fc8ad5b8ed5132421f2b94c98bdc31b144d86b6255cdae63fbe27f9040ebed3')
sha256sums_x86_64=('4cd8e6622c2453a06434d55ded5c7b94bfdc5b2dadba8b946435e1603fdcdf32')
sha256sums_aarch64=('a89357604474a5ac12fb33422126f8e3daa61615cd1544959ee974c6b334a874')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "KEYBINDINGS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/KEYBINDINGS.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
