# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=cadamsdev
_pkgname=gitarbor-tui
_appname=${_pkgname%%-tui}
pkgname=${_appname}-bin
pkgdesc="A next-generation Git client that runs in your terminal. Built with Bun, OpenTUI, and React."

pkgver=0.0.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('b23b36b0b9406fb4dc8fe11777d2ef011ba0a8d734980f2cfb6be2e496089bf7'
            '56e244cc2182806d882f77fe41d36159d3d676fe120edf561e1b6ec6073d6bbe')
sha256sums_x86_64=('11add8a92c613b6fd04444c5c79359d5d62a315911fa622201d7c1451f3bf99d')
sha256sums_aarch64=('c3a10c833e548ef9b8ce06d3879ac52a1ee31a7638421de4ec6bef9a2745e4ff')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
