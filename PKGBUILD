# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=hiroaqii
_gitname=gitframe
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal workspace for reviewing Git changes, browsing source, and exploring history"

pkgver=0.1.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
sha256sums_x86_64=('85ad866d8bcec52162570e763ae3417c59d996c20af46b9ad0a7bc8fc86f26c2')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/${_gitname}-${_gitversion}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "docs/guide.md" "${pkgdir}/usr/share/doc/${pkgname}/GUIDE.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
