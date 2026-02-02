# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=jg
_pkgauthor=micahkepe
_pkgname=jsongrep
pkgname=${_pkgname}-bin
pkgdesc="A JSONPath-inspired query language over JSON documents"

pkgver=0.4.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-musl')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums_x86_64=('4b7c21fefb1630dbff3d58dc727b8469e505ee4763486ba6b58e963077e65d29')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
