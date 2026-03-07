# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=eduardofuncao
_pkgname=squix
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="A minimal CLI tool for managing and executing SQL queries across multiple databases"

pkgver=0.3.0
pkgrel=1
_pkgvername=v${pkgver}-beta

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

conflicts=("${_pkgname}")
provides=("${_pkgname}")
replaces=('pam-bin')
depends=('glibc')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}")
sha256sums=('f87660b383928d6c66256ff89cc4c441e041b16fc786760822bd49567e33fcde'
            '3634dc108e1a9d30b8faab91fe1f6bc322b64dc03e65eaf315fde19fde6cbcbf')
sha256sums_x86_64=('82333768ced2abbf3b6e44c6811a097823c8d28fad827402f7ee91516a52f8c3')
sha256sums_aarch64=('81ac10cca5b7c7efae2538592591716cf1e82e7247ac2d0a4b8458e220c8cddd')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
