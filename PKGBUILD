# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Dark-Alex-17
_gitname=coyote
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="All-in-one, batteries-included LLM CLI Tool"

pkgver=0.7.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}.tar.gz")
sha256sums=('cce7aeb3e92132ab16a01d9c3fa34713b11d3a68c0e213fd144040f2aaf72a81'
            '16d0b134f225596b5046ab790bcf7b516039826c01dce6b92f3e404c5eabfa3d')
sha256sums_x86_64=('76bea9ce98bf501b8ace97024b62927bcc91fd833b3592dcebaba55541ae33ba')
sha256sums_aarch64=('dc092fcc28356637d3165ad603bee4c340a3aedfbada8176be310360f5fe4937')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
