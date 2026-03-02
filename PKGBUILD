# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=olivier-w
_pkgname=climp
pkgname=${_pkgname}-bin
pkgdesc="CLI Media Player"

pkgver=0.3.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'alsa-lib')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_${_barch[1]}.tar.gz")
sha256sums=('0f226882aaed3055d710992137a01468912269210dcca89e20c8f2b746c96af1'
            '52be0de46b2ed866c6c6b02f7d2ed1e0f13a92e49b8e426b6f87fe308a064b37')
sha256sums_x86_64=('239a217bc48780b1fd0efc6b7d2de294e7c6dd745d38aab32ebd18fe515eb2a1')
sha256sums_aarch64=('ca65958ae74fd5c6f1c0a670aee660fbf4e91a4a78166307307a9038b31a5c70')


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

	install -Dm755 "${_pkgname}_${_pkgvername}_${_CARCH}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
