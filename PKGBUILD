# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=liquidaty
_gitname=zsv
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Tabular data swiss-army knife CLI + world's fastest (simd) CSV parser"

pkgver=1.4.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64-linux-gcc')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'ncurses')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('87ae0efb4c6f4a9e8796915132eb138ab94f3e995ec4cfb3a549d4b0001ead63'
            '2c9351020e16d46296f775e38f7ac172d5846ad9e9016272ffa0ce866920d8c2')
sha256sums_x86_64=('1f5b0d16e219c5e7155b6a9037e1cc084da5a9083562d92ba71aca3e03c5284d')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_CARCH}/bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
