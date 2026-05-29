# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=blacknon
_gitname=baeru
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A wrapper that adds reveal effects, live ANSI recoloring, and keymaps to existing terminal apps"

pkgver=0.3.0
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}.${_barch[0]}.tar.gz")
sha256sums_x86_64=('6edd3c8148f36737083e7b631b3837c3dec87ad6cf6cec6e4f2aebecb76773b1')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -dm755 "${pkgdir}/usr/share/${_appname}/"
	cp -rf "examples/themes" "${pkgdir}/usr/share/${_appname}/"
	cp -rf "themes/"* "${pkgdir}/usr/share/${_appname}/themes/"
	cp -rf "examples/keymaps" "${pkgdir}/usr/share/${_appname}/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
