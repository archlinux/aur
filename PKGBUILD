# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=bsky
_pkgauthor=harveyrandall
_pkgname=${_appname}-cli
pkgname=${_pkgname}-bin
pkgdesc="A command-line client for Bluesky"

pkgver=1.9.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_pkgname}")

options=(!strip)

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('8eef146b7927dcca8c97b443fad1dacfb14b8826fa6998ad4e440ee147b41722'
            '2020286678833933fcd6e55db50cc28d10a069284171b71b6ae95a301e5a82f2')
sha256sums_x86_64=('e9f81de40847dfbba794702ee850a78b86e6b03999a34ad4501fc92e59e4fef3')
sha256sums_aarch64=('c23281ed65a8d92445a61749978154c921a0d79dc0fd307d9aa7d7db5e451312')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
