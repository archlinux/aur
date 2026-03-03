# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=valentinradu
_pkgname=Pent
_appname=${_pkgname,,}
pkgname=${_pkgname,,}-bin
pkgdesc="Wrap any process in a filesystem and network sandbox"

pkgver=0.0.4
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('9b2d7324c180b220f5be3c63bf3d3fd4ccd8172fe6fb33328ebf0dc5a9ed0aa6'
            'fdbff1942963f9e9e15aecb13800bb42886a349a681b94236d511d6715d27fbd')
sha256sums_x86_64=('a43193205ab8b44253956e38a71f5e4f0916ae7bb410df9b1645a74f84b6a25f')
sha256sums_aarch64=('39bc487ba3861a1084a00970be16b253f547520bbd145677833821615a07e104')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
