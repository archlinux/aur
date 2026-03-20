# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=bsky
_pkgauthor=harveyrandall
_pkgname=${_appname}-cli
pkgname=${_pkgname}-bin
pkgdesc="A command-line client for Bluesky"

pkgver=1.6.2
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
sha256sums=('bef1ca6360e72222f03f6d72864de96ecde1e9e1fc0c9b58912420d495c872db'
            '2020286678833933fcd6e55db50cc28d10a069284171b71b6ae95a301e5a82f2')
sha256sums_x86_64=('df630c9063f7fc1618fb6b8ddf401359ca39864d45d40bd3bacb5e8b0a28e54a')
sha256sums_aarch64=('0203aed41eeb499f6bc92466a88acca0cde63b68bbf2fb1ba2c079cf4a2cd4ec')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
