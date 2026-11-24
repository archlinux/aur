# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=gusco
pkgname=${_appname}-bin
pkgdesc="An opinionated, orthodox file manager distilled from Commanders past, written in pure Go"

pkgver=1.10.0
pkgrel=1

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://intestinate.com/gusco/"

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::https://gitlab.com/intestinate/gusco/-/releases/v${pkgver}/downloads/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::https://gitlab.com/intestinate/gusco/-/releases/v${pkgver}/downloads/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('def089a01b0f7dc9bdda8890411f291b5feec198c555680cca127e16fa328bed')
sha256sums_aarch64=('ffc07e9a28a6979dc88ce5368cf4413df99b92725a67bf10405022ccc108a49c')


case ${CARCH} in
	${arch[0]})
		_CARCH=${_barch[0]}
	;;

	${arch[1]})
		_CARCH=${_barch[1]}
	;;
esac

package() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/" || exit

	install -Dm755 ${_appname} -t "${pkgdir}/usr/bin/"

	install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
