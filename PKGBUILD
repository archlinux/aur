# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=eduardofuncao
_pkgname_old=pam
_pkgname=squix
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="A minimal CLI tool for managing and executing SQL queries across multiple databases"

pkgver=0.5.3
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
            'f2c6f4879e00f2a134d1aa7fdd8b16d9fffca3b7f54931a43d77fbf13cfbe753')
sha256sums_x86_64=('5f180db8cf9f05e323161a6dca53477ccbf7c14850f47866f6464d4c4c973594')
sha256sums_aarch64=('353d041d536e4428a7d0831a744b517bfb08666e29c13c7880a8bed6475820a7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
