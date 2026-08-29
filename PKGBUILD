# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=opmr0
_gitname=xeq
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A cross-platform task runner that validates, runs, and prevents script headaches"

pkgver=2.4.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/readme.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENCE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
sha256sums=('ed67a55ba16187fa4ea81dd7d462e2c980e43798dece6f3823e5c1b0186c8c7c'
            'fe66e326fee20e3cef980dc69e5921df6c17253120efa9d9974bbd0d942cf244')
sha256sums_x86_64=('3cd8f4a0bbd47e0c06eae3b141ff9395ad8424313db0b7980c827f533efb3c9d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
