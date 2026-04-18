# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dolthub
_pkgname=doltgresql
_pkgexec=doltgres
pkgname=${_pkgname}-bin
pkgver=0.56.2
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Version Controlled PostgreSQL"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

provides=("${_pkgexec}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}.tar.gz")
sha256sums=('02eca416f9bc62b96ec75364b11cca7d6f95e7c7d7ced61ed6c9b9e3a667d0c7')
sha256sums_x86_64=('1e640a8cb5935871d312502f9a69dbe0bd6e2b09e86a1cdc6e3c380e1e361a74')
sha256sums_aarch64=('5f9eb4d3adaf6c035830a7438bab942175bbba95abc502aae4b4dae9f414bb07')

case ${CARCH} in

	${arch[0]})
		_BARCH=${_barch[0]}
		;;

	${arch[1]})
		_BARCH=${_barch[1]}
		;;
esac


package() {
	cd "${srcdir}/" || exit

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	cd "${srcdir}/${_pkgname}-linux-${_BARCH}/licenses/licenses/" || exit

	install -Dm644 "APL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APL"
	install -Dm644 "BSL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-BSL"

	cd "${pkgdir}/usr/share/licenses/${pkgname}/" || exit
	ln -rsf "./LICENSE-APL" "./LICENSE"

	cd "${srcdir}/${_pkgname}-linux-${_BARCH}/bin/" || exit

	install -Dm755 "${_pkgexec}" "${pkgdir}/usr/bin/${_pkgexec}"
}
