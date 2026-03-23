# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=GitTools
_pkgname=GitVersion
_appname=${_pkgname,,}
pkgname=${_pkgname,,}-bin
pkgdesc="From git log to SemVer in no time"

pkgver=6.7.0
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname,,}")
depends=('glibc' 'libgcc' 'libstdc++')

options=(!strip)

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}-${_pkgvername}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}-${_pkgvername}.tar.gz")
sha256sums=('cc489ec2af329cbd87b0047a98f9e64745496b0f0c100aeb5b58c48fb8826045'
            '3bdeb88619a256f8b8615599a67db3195028d969490c0e87a8cb4b5917bf340c')
sha256sums_x86_64=('e2012abfb3392a6f0ccf5f82738173c291b15bfdb2d5e9197777ec3f41b88f76')
sha256sums_aarch64=('180fd7cf40fdfacf2c251176a4b613a444db2b40af477fd07a7c6d4d6b355dc6')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
