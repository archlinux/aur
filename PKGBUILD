# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=julesklord
_gitname=mangofetch
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Tool for fetch everythin' in internet"

pkgver=0.7.4
pkgrel=2
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'xz')

options=(!strip)

source=("ICON-${pkgver}.svg::${_ghurlraw}/docs/assets/logo.svg"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"${_appname}.desktop")
source_x86_64=("${_appname}-cli-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-cli-${_barch[0]}"
               "${_appname}-gui-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-gui-${_barch[0]}")
sha256sums=('c51ee75957efd5604dce49c014c86bf0ec40770f48461b7f447a922ae8cef3c8'
            '3a4e01fd98cfbcaf7cda0d33069788b3d36bb37af68c95c208ff89588ddc8a33'
            '230184f60bae2feaf244f10a8bac053c8ff33a183bcc365b4d8b876d2b7f4809'
            'ae922cb150cbec60cebb3b46423396d452e02f62dfafb88952fe19aaf0381bc7')
sha256sums_x86_64=('ca6f8b230072f924e6873778ad4fe66723b54940733506aff4c044c84ec9f86d'
                   'f477bbc857b12c3b9e23196d4efd5827ffb7108613a031b11f634efe3a1003a5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-cli-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"
	install -Dm755 "${_appname}-gui-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}-gui"

	install -Dm644 "${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"

	install -Dm644 "ICON-${pkgver}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

