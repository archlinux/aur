# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=eduardofuncao
_pkgname_old=pam
_pkgname=squix
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="A minimal CLI tool for managing and executing SQL queries across multiple databases"

pkgver=0.5.4
pkgrel=1
_pkgvername=v${pkgver}-beta

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

conflicts=("${_pkgname}" "${_pkgname_old}-bin")
replaces=("${_pkgname_old}-bin")
provides=("${_pkgname}")
depends=('glibc')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}")
sha256sums=('f87660b383928d6c66256ff89cc4c441e041b16fc786760822bd49567e33fcde'
            '14d54f8d355314b23f799bd4ba2cefddd447127665057378374676485279b8b6')
sha256sums_x86_64=('2886a9c3c1bc1f30b16d7ddb29fa564faa9afcdae410ded6d44a33ca64bd43fc')
sha256sums_aarch64=('8d79eaa28326aebacace3f266e533ac74c2f908bc2518c8f2d0f6e538ace5f56')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
