# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=furan917
_gitname=go-solar-system
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal app where you can explore solar systems"

pkgver=1.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('4a6b471919c5dc69a2970d5f65360b667e7133a79c17d26970c245e81c560105'
            'dcfb0a6f46215c68ede3f5088eb72df4f059d033e1fef000f33fbff9e4c7ac19')
sha256sums_x86_64=('81a371c8018649109e2b8071e5dbc19d4913bf002a747f1f13d13ed75841385e')
sha256sums_aarch64=('bce5305b670b3a7412698b8393553cb1cc12292d0db1a8aa0e02f9d38c93d076')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
