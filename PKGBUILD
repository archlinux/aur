# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=mendrik-private
_gitname=sqv
_appname=sqview
pkgname=${_gitname}-bin
pkgdesc="A keyboard-first terminal viewer for SQLite databases"

pkgver=0.4.0
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

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENCE.txt"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"EXAMPLE-${pkgver}.db::${_ghurlraw}/examples/chinook.db")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('d21f768901e1abb761a57da47ab03b3cbc0f6e1725529cd3667ca8b830bc1919'
            '23fff3fb6c42cfa55023528a33973e513decbac7618116cbe660eb09802cf010'
            '1de96d159d647e33944d1f07d8197e30d6722cefa3fbc0933366fa91b5552eeb')
sha256sums_x86_64=('4143b47aeff57e93b26b4b52f2a27e56a7977bdeadae1337d7ff0350b07c7ff6')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "EXAMPLE-${pkgver}.db" "${pkgdir}/usr/share/doc/${pkgname}/examples/chinook.db"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

