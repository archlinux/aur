# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=altlimit
_gitname=passedbox
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A local-first, zero-knowledge file vault"

pkgver=2026.03.09
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('LicenseRef-NON-COMMERCIAL')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'glib2' 'gtk3' 'gdk-pixbuf2' 'libsoup3' 'webkit2gtk-4.1' 'hicolor-icon-theme')

options=(!strip)

source=("ICON-${pkgver}.svg::${_ghurlraw}/desktop/frontend/public/logo.svg"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"${_appname}.desktop")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.zip")
sha256sums=('d3cbf5cb48ef5e4f4ddaf1408ed9efdf76b3953c53be56d8f2b82763da66fc20'
            '654dc7d474298cc1977ad405ce6581b932e0b18cdcabffb1aa7126913f0176d6'
            'd779677117f60d6f3e82a944388c787b30bfa69d6f63ad739b096c71aaf876fc'
            '70d87c7734483b2d98638b5ddb1aef701dcdab217033fb7bff86dc53a5427a85')
sha256sums_x86_64=('b774b74a15acefb9a44119b6d23e35fc2615491519bc062a209711e6cfcb4ded')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"

	install -Dm644 "ICON-${pkgver}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
