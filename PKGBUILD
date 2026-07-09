# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=danfry1
_gitname=hacker-news-tui
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal UI for browsing 'Hacker News' - feeds, threaded comments, bookmarks."

pkgver=0.1.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('f0e0d16530d33c06cb92a63a75f6114d649cc2274eb3664321a12404e1dcd606'
            '64453929f96a9207eac24361cc871149ac05d6590b8bd071d085b6a07ba740e7')
sha256sums_x86_64=('1985c8aa417c4457c5ecaca16deded2dff67d3507a250ba3a8df31e8131d5ecc')
sha256sums_aarch64=('d11d17d064eea3de975e7a3f5840452c35f66d75b0df9d5d99ae2ff3ac1b12d0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
