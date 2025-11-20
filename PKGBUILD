# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dolthub
_pkgname=doltgresql
_pkgexec=doltgres
pkgname=${_pkgname}-bin
pkgver=0.53.4
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
sha256sums=('fb042767139e0690c214fc314c4760e94c37b2a1aa7e4bcf4c5a42e2747f4ef9')
sha256sums_x86_64=('8b603f56fa3477ac327637272c9784ccbb8d361d79fad370a0ddf1492ed47c23')
sha256sums_aarch64=('869c240459ded2b0df5c87f2bf0c824b22265ef92ecc681b413087cee1c60b11')

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
