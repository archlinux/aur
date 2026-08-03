# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=mendrik-private
_gitname=sqv
_appname=sqview
pkgname=${_gitname}-bin
pkgdesc="A keyboard-first terminal viewer for SQLite databases"

pkgver=0.2.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENCE.txt"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"EXAMPLE-${pkgver}.db::${_ghurlraw}/examples/chinook.db")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('d21f768901e1abb761a57da47ab03b3cbc0f6e1725529cd3667ca8b830bc1919'
            '43b57d457874914a4c4132901a71d5539a39240816706282407a955dbe23782c'
            '1de96d159d647e33944d1f07d8197e30d6722cefa3fbc0933366fa91b5552eeb')
sha256sums_x86_64=('8e9303ccd8a32ee122bc00b62129c24c7eb73e044973a86f47c67a5ab11516cd')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "EXAMPLE-${pkgver}.db" "${pkgdir}/usr/share/doc/${pkgname}/examples/chinook.db"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

