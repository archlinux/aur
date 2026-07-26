# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=LinPr
_gitname=sqltui
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal UI browser for SQLite databases"

pkgver=1.0.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('sqlite')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('fb1e339e4a6790edcad297e9a65c1a33878d52374e993e18861b88d65d006f27'
            '36e10bd996f5748fd7d2229b26a3f524bbf5c0281c84fecbd8d7b3ad6b077029')
sha256sums_x86_64=('38c77b93b908678d30fd0cced6dabd1e35a6bc65547c6bbc2d19495b7b21cb6b')
sha256sums_aarch64=('2f4d8f7289dc74f2570f3155849a088d6a9f279dc2efe51ada421bd6e6d7213f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
