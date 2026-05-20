# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=try
_pkgauthor=tobi
_pkgname=try-cli
pkgname=${_pkgname}-bin
pkgdesc="A fast, interactive CLI tool for managing ephemeral development workspaces"

pkgver=1.5.3
pkgrel=2
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname}")

makedepends=('patchelf')
depends=('glibc')

options=(!strip)

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}-linux.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}-linux.tar.gz")
sha256sums=('5279d0d64164a7a65293fab61f38322d9965f3e5eb21b861d4c89a15ebafb9e0')
sha256sums_x86_64=('f1278dc312883b016c1d4b53199f59cc2c1d8f989271fe1144141313b79bcac6')
sha256sums_aarch64=('9baa82340d1d141cc5b2f18a981a42e595845ee710e1f2b35317cd725a99216b')

prepare() {
	cd "${srcdir}/" || exit

	patchelf --set-interpreter /lib64/ld-linux-x86-64.so.2 "${_appname}"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
