# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=yazeed
_pkgname=proc
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="A semantic CLI tool for process management"

pkgver=2.0.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('c7f9eb97a593a88e42431614564bf73d3b2177ffbc959a63cfe62856b4a10d1e'
            '67107d408c9bf723def769d1ebc8da192b16920ddeff9c2e390005dd4949950e')
sha256sums_x86_64=('dd2f2f479dd0d5a2c6389546800168803a36a6951a564b82b4e71d21668aa909')
sha256sums_aarch64=('cacc92a3f9fc94ec6206da11c9bd453733f51ea521921a32e91d37ba9af0ff41')


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

	install -Dm755 "${_pkgname}-${_CARCH}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
