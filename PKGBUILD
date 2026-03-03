# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=rohansx
_pkgname=vgx
pkgname=${_pkgname}-bin
pkgdesc="A Git pre-commit security scanner with LLM integration to detect vulnerabilities before they enter your codebase"

pkgver=2.0.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[1]}")
sha256sums=('98daa662ddf50d0943325a85c4816dcad498acb522ab4d08f0e31e6049fb1084'
            '3b7cea79aafb99e78919cd599aea32ba77a5db8ad33c2ff677e5ca4f1fb5b3fc')
sha256sums_x86_64=('4eba155610c22efa3d467a6a13b3f552a6b99de70af22b7bb7facdfd16bc84bf')
sha256sums_aarch64=('b3ae24d74d8379ad21bf4d37d7c2a819d50539d4074b9c7bdadc8d6bd25419e7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
