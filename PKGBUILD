# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=GitTools
_pkgname=GitVersion
_appname=${_pkgname,,}
pkgname=${_pkgname,,}-bin
pkgdesc="From git log to SemVer in no time"

pkgver=7.0.0
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
sha256sums=('fa8a87311383df96201b15bfa7f91bbfbdfcc0942bcd4fc8c0588099d370cd50'
            '3bdeb88619a256f8b8615599a67db3195028d969490c0e87a8cb4b5917bf340c')
sha256sums_x86_64=('770ac90bc17b4608e9a95b854d398ee4c24c5a51866019204f56cebfd87e1913')
sha256sums_aarch64=('745475b9e1dda5aa9530f364d5c209a595ba8ff751bf9a9cf5f00a946c9aa654')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
