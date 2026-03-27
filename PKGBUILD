# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=AppachiTech
_pkgname=suvadu
_appname=suv
pkgname=${_pkgname}-bin
pkgdesc="A database-backed shell history replacement with fuzzy search, AI agent monitoring, and interactive TUI"

pkgver=0.2.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}" "${_appname}")
conflicts=("${_pkgname}")

depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}-${_pkgvername}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}-${_pkgvername}.tar.gz")
sha256sums=('1274eb23ff3f50b223a2f470b75dbd8500eb58f8df5b50ca4796b1111698b680')
sha256sums_x86_64=('ba8d2fae65885e1e203ffc7e5f3bbb0496328cbb6610769178c78e6ac233f9e3')
sha256sums_aarch64=('ef386d74e9556550d752e3479cb585a80f891c3d78ca6a5b8560723e9d1fe6eb')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"
	ln -sf "/usr/bin/${_appname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
