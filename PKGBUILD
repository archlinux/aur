# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=danfry1
_gitname=hacker-news-tui
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal UI for browsing 'Hacker News' - feeds, threaded comments, bookmarks."

pkgver=0.3.0
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
sha256sums=('3f36cce88c5a8104ffa9361a3a4d46c3fe847a139940ad8ac66010b98f413f2d'
            '64453929f96a9207eac24361cc871149ac05d6590b8bd071d085b6a07ba740e7')
sha256sums_x86_64=('94bc39173ee7c056b3b0aa20434578c3fcfe8c2a53a75fba8698aa087d11ccec')
sha256sums_aarch64=('f6a394758bfb86805c024a51f9871eb76c8f3ffa1039f4dd3a5b71d83ae5760a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
