# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unvalley
_pkgname=rt
_execname=${_pkgname}
_appname=${_execname}-cli
pkgname=${_pkgname}-bin
pkgdesc="One command to run tasks across task runners"

pkgver=0.1.8
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_execname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}-${_pkgvername}.tgz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}-${_pkgvername}.tgz")
sha256sums=('08a555dad3bc78b57a584f21fe995e94b2215f3d4628bda053fd332d532fa95b'
            '6f5d613dfd80e5f564ed3ddc0c62c57984b0b71505ea91049a95e8056ea397a6')
sha256sums_x86_64=('de9598d17de185190264083bfd776e1791c0dd6c4def4d1511fb1734c613f610')
sha256sums_aarch64=('161adcced77026a6a8a05f58792e89b967a7a80e0b581b00b9ec39fe97a19859')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
	${arch[1]})
		_CARCH="${_barch[1]}"
		;;
esac


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${_CARCH}-${_pkgvername}/${_execname}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
