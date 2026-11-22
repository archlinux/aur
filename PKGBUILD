# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=reekta92
_gitname=graf
_appname=${_gitname}
_appsufix=rs
pkgname=${_appname}-${_appsufix}-bin
pkgdesc="Terminal-based force-directed graph visualizer for markdown wikilinks"

pkgver=1.1.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%%-bin}")

depends=('glibc' 'libgcc')
optdepends=("clin")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_appsufix}-${pkgver}-${_barch[0]}.tar.xz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_appsufix}-${pkgver}-${_barch[1]}.tar.xz")
sha256sums_x86_64=('4a0b5f3a1ed836c7acb8a4618d0d10fb4fe02fdd1efc64dc74de258072400fc2')
sha256sums_aarch64=('e384f0dd75921be8ed34a86a69bdc896fc9d754c81bd6072155643cbe7dc6cdf')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_gitname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
