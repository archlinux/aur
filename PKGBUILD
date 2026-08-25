# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ralsina
_pkgname=crycco
pkgname=${_pkgname}-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A literate programming tool"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[0]}")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[1]}")
sha256sums=('91c5a6fc53adf00971f7b4851ae27b91291e470a67f2474d00c965d05dc7d286'
            '0fed41562abf1b65f32c86019ce630e75848d7f4d772bd04e3b5f5c903f6db8c'
            '35ddea34349d7ae57e0d885ecbfdc26d6fd3cdf83ae1d0cdcd04699646faeb1b')
sha256sums_x86_64=('b084094ceaa487c414a386874fa210deef62512fb2585a9d4bd14aa3337d7097')
sha256sums_aarch64=('fa36f40191e83d95672fc2c1429c78793a55be34c1f509f7e9921dbd8804f11f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-static-linux-"* "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
