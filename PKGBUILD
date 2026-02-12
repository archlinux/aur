# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=cadamsdev
_pkgname=gitarbor-tui
_appname=${_pkgname%%-tui}
pkgname=${_appname}-bin
pkgdesc="A next-generation Git client that runs in your terminal. Built with Bun, OpenTUI, and React."

pkgver=0.0.3
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_pkgname}" "${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('65f8ddfcff0065af378e3dbf1087377112160328004967c651ccd0ae363c13ec'
            '56e244cc2182806d882f77fe41d36159d3d676fe120edf561e1b6ec6073d6bbe')
sha256sums_x86_64=('2dae4ade1eabd60ba373658db69d887a6cfc6af2869fb263a3681f7f9e238baa')
sha256sums_aarch64=('1a518a71ce6a03006f1dc34b8ad3da67b2649de3b9be8b6610887925e449f19e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
