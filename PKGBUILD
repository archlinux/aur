# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=GuestAUser
_gitname=dtask
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A fast, mouse-first terminal task manager"

pkgver=1.0.0
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

depends=('glibc' 'libgcc')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
sha256sums=('cacfdf9578a2b11c8aa89c6d2ae63d79817fb86ffd088429bf54cd88878dac3c')
sha256sums_x86_64=('6bba68c5b60d99282c1714d1daad56f94ff20d940a1537fb689f65ecb4e58a3c')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/${_gitname}-${_gitversion}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -dm755  "${pkgdir}/usr/share/${_appname}"
	cp -rfa "themes" "${pkgdir}/usr/share/${_appname}/"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
