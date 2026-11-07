# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=gusco
pkgname=${_appname}-bin
pkgdesc="An opinionated, orthodox file manager distilled from Commanders past, written in pure Go"

pkgver=1.9.3
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
sha256sums_x86_64=('f496839f9db3ed4d65ee81fb481038945f3bf122c5118b54bed758abff51a706')
sha256sums_aarch64=('f2722395647232ffe7b29efdcd9e01e7513495bd2a29ef6db529bbcd38b58d60')


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
