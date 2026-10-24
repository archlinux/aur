# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=jackMort
_gitname=brothy
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A calm terminal Markdown reader: folder tree, outline, live reload, Obsidian-flavored, 26 themes"

pkgver=0.1.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('c74cfa6a759fdbd476b9288fac70f8e3126f1062d8d77d1bf38f5eba5e822dea'
            '483336fdde3746910f4fed5c399c64c765c2cdf19f886ad952c8af6c6a663b35')
sha256sums_x86_64=('7d6b3e44d05e1e444e6150828fc352b51b612dcb8a75d4614929196c4b24fce7')
sha256sums_aarch64=('82e2152085ce24ad1a2ebdeafb145bacf4979d4e4fef33acbb99d4250fab4a32')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
