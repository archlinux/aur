# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=mendrik-private
_gitname=sqv
_appname=sqview
pkgname=${_gitname}-bin
pkgdesc="A keyboard-first terminal viewer for SQLite databases"

pkgver=0.1.5
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
            '24300f0a2db7720236859cef6e3ddeb7b5a1f29e65d51216f84eb188e908b05b'
            'a4ed0a2d4b7034ab6ccd66fe1dcbe61ada337d2bcf6c9cfc419449b1e5143ca4')
sha256sums_x86_64=('3b8cea57e1bacb84def5cd97af369aa2b2f6eb4422116315420d75bab49b0393')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "EXAMPLE-${pkgver}.db" "${pkgdir}/usr/share/doc/${pkgname}/examples/chinook.db"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

