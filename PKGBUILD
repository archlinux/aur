# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mainak55512
_pkgname=qwe
pkgname=${_pkgname}-bin
pkgver=0.3.3
pkgrel=1
_pkgver=v${pkgver}-a
pkgdesc="A simple file-first atomic version control system"

arch=('x86_64')
_barch=('x64_linux')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgver}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgver}/${_barch[0]}.zip")
sha256sums=('de59ae1d48f86ce9e4e2a9c5e1d444e8c82141af988ba646ce05bfa10733ec35'
            '5f8c1ed98719545d8d057269852f9e446e0ad092135ec5e92374dc8ce9e0e6ad')
sha256sums_x86_64=('3105de69f0be5ab304d7f87060ac44af8834c181f5e92e6428f59b8d82a7b5cc')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "release/${_CARCH}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
