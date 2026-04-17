# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Strophox
_pkgname=tetro-tui
pkgname=${_pkgname}-bin
pkgdesc="A cross-platform terminal game where tetrominos fall and stack"

pkgver=3.1.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername%.0}_${_barch[0]}.zip")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername%.0}_${_barch[1]}.zip")
sha256sums=('a478af0aea2bc61bfa73878ed4067a60479e070284d993e413dcd98b0c079bdb'
            'b23d5471464616610a171c68ec3b23a127b52fc17c33a119c1eb997d1a00149b')
sha256sums_x86_64=('3215b2a3055ac1e16a6dbe1385ea8c7beea96ef3c64770b9884ee92b2b238f97')
sha256sums_aarch64=('29c3f67b7147f14f441fc81abf6036420dcda725ade9f10b2356e99abf8d53a5')


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

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
