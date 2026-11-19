# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=yaroshevych
_gitname=bypass
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Modern terminal secrets manager compatible with KeePass vaults"

pkgver=0.3.5
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

depends=('keepassxc')

options=('!strip')

source=("CLI-${pkgver}.md::${_ghurlraw}/CLI.md"
		"TUI-${pkgver}.md::${_ghurlraw}/TUI.md"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('89ae0dc541a883ee8bec04450f94bb7dd314230852bebb10349c99ddbf3a2e18'
            'b881d60f0ad5424f964bb0426c62cc4249899cde3691f16166d0037f6d34225b'
            'c81c2d252305b89c1bbcc2ca30d33636db4c5601ef4404f1ad6a37f204546b58'
            '54cf7b716c85a4a5911a09de2fe15689f6b40d1c27ca0bb6153c800f54e71570')
sha256sums_x86_64=('54e72fa2b67680c7a343dc47d8a0d2448506cab676381e00cfe2587dd79ab27a')
sha256sums_aarch64=('16b2531b2fd23bc128781c76b42e38cb38fa068dcae99d35e4ae0976f3659cfe')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "CLI-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CLI.md"
	install -Dm644 "TUI-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TUI.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
