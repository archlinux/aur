# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=bsky
_pkgauthor=harveyrandall
_pkgname=${_appname}-cli
pkgname=${_pkgname}-bin
pkgdesc="A command-line client for Bluesky"

pkgver=1.5.0
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
sha256sums=('1cbd80cca1d6a1a29aed1f8556f1d7e6fcb916b742272aea8a6b94223292c862'
            '2020286678833933fcd6e55db50cc28d10a069284171b71b6ae95a301e5a82f2')
sha256sums_x86_64=('a55163495c910c7578a656bbb67a6a761be5df959b3a79c605388349b111dd88')
sha256sums_aarch64=('56167cf41b017faf0c93f9c2589291b771e31fd78ab6f0bd656258674c2353e9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
