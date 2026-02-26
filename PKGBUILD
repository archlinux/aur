# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unvalley
_pkgname=rt
_execname=${_pkgname}
_appname=${_execname}-cli
pkgname=${_pkgname}-bin
pkgdesc="One command to run tasks across task runners"

pkgver=0.1.9
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
            'afb35d5046468b12a257dbca4685f5fc705c0c1e222dad8920c48b7486ec414a')
sha256sums_x86_64=('acadcf4c116a984d23cd15d7445a183d6bcd3a2c8f4921ec524eeb21d4ad22a0')
sha256sums_aarch64=('ac5c568296bbdff55ada0f7012ee0d4c476cb7621014bf69140f70dd84aa04af')


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
