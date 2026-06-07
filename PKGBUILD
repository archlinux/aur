# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=programmersd21
_gitname=bangen
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="✨ Colorful animated ASCII banners in your terminal"

pkgver=2.3.0
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64')
_barch=('linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc' 'zlib')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}-${_gitversion}.tar.gz")
sha256sums=('5f8af593ed54cdafe718bfdcc25572c27e87c0cab3016d8f798ba0fb2abf6179'
            'e47ee26134da1053f49b3ba41d8c376e772f1957afded5c1b71049aab6081bad')
sha256sums_x86_64=('1cc5eedbd468743be5a1d2b22f6b55873a781ae38327ddb6cee5611a7c2e6790')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${_CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
