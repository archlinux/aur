# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=bsky
_pkgauthor=harveyrandall
_pkgname=${_appname}-cli
pkgname=${_pkgname}-bin
pkgdesc="A command-line client for Bluesky"

pkgver=1.3.0
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

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('fcff885150a5287332baa57d0dbc9876b694488d2e90c2743cb85575abc0947c'
            '2020286678833933fcd6e55db50cc28d10a069284171b71b6ae95a301e5a82f2')
sha256sums_x86_64=('cabf4a2cb6d1f6b9b637b4715a266b4ac78fcb86242248e0940429e9c5f24bfa')
sha256sums_aarch64=('c86753369ab80d706e86d84515183347f6a12ded41e54a17d23c45905f241515')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
