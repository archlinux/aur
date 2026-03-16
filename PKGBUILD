# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=bsky
_pkgauthor=harveyrandall
_pkgname=${_appname}-cli
pkgname=${_pkgname}-bin
pkgdesc="A command-line client for Bluesky"

pkgver=1.6.0
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
sha256sums_x86_64=('cb53365fe3adc95c9b0567191b8fa8dba674b2e6dda100c5fc5cb0a5bec054e6')
sha256sums_aarch64=('f43eae66d8b9a567506fa4006587fae0e2e8db4c3e68adf067c3a8f3f052c2a9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
