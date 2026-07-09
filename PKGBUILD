# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=guilhermeprokisch
_gitname=see
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A cute cat(1)"

pkgver=0.9.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'pcre2')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_appname}-cat-${_barch[0]}.tar.xz")
sha256sums=('90dba77b43283023948b071c0dbf7f1abfea89f969a856074198cf73087e1176'
            '7ba414491c618779f37230964c48422c38ce4101b5e42fcfb5102515251021ed')
sha256sums_x86_64=('e701a7e4726e69a3ce5d22b772df3919326eae824eb93450989dbdb435d1fdb7')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/${_appname}-cat-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
