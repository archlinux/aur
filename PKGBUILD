# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Jagalite
_gitname=superseedr
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A BitTorrent Client in your Terminal"

pkgver=1.0.14
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0-or-later')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'openssl')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[0]}.deb")
sha256sums=('ab4f4084d6f6ae11432d1379502ce107b46809f8176eb1dbc4c471fcfa69f10d'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('b846d7a639a8fae30723607d1c90afc402be26fd59d7bd2a8e4f95bb7dc28eae')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.gz" --no-same-owner

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
