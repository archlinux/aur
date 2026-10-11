# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=programmersd21
_gitname=bangen
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="✨ Colorful animated ASCII banners in your terminal"

pkgver=2.3.2
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64')
_barch=('linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('zlib')
provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}-${_gitversion}.tar.gz")
sha256sums=('256e8f67cda288ce5f35ce41995d4d18531da89c5cd1c4e044ad44f509bbea87'
            'e47ee26134da1053f49b3ba41d8c376e772f1957afded5c1b71049aab6081bad')
sha256sums_x86_64=('50da94dea6f88945b5851d628efd436c5b12da69c7c6a11e0b8e5375f6704e21')


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
