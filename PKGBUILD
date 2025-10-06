# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dolthub
_pkgname=doltgresql
_pkgexec=doltgres
pkgname=${_pkgname}-bin
pkgver=0.52.2
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
sha256sums_x86_64=('6bcedcf914b2a7e79b91b823cf946db612db902c8e6ce053ae623382840560d1')
sha256sums_aarch64=('2da7ff6863b38c0c1419353ed5383f68b4b6c27c9a20eea98d871e3b6c453e44')

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
