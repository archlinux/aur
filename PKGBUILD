# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=eduardofuncao
_pkgname=pam
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="A minimal CLI tool for managing and executing SQL queries across multiple databases"

pkgver=0.2.0
pkgrel=1
_pkgvername=v${pkgver}-beta

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}")
sha256sums=('f87660b383928d6c66256ff89cc4c441e041b16fc786760822bd49567e33fcde'
            '35631325772760fb137c401956790752650bf29e0351795cb30fea430c185155')
sha256sums_x86_64=('baec651d37cc0899081976ad8ece6f378d3372fab7cef4092ea8eefbfe75b462')
sha256sums_aarch64=('87ba1994ca6e3d2a4c706c6de0ba7da9efe87b089a2a3fdd6bb280e6f46bf432')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
