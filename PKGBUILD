# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=rcawston
_gitname=Malgel
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A fast, native Markdown editor"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'hicolor-icon-theme')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums_x86_64=('cbab1bb460ab5bffd8ce6b6614c180b9ee1151014db40e2bc28396d6158cfa6f')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/" || exit

	install -Dm755 "bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	find share/icons/ -type f -exec install -Dm644 {} ${pkgdir}/usr/{} \;
	find share/metainfo/ -type f -exec install -Dm644 {} ${pkgdir}/usr/{} \;
	find share/applications/ -type f -exec install -Dm644 {} ${pkgdir}/usr/{} \;

	install -Dm644 "share/doc/malgel/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "share/doc/malgel/NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
	install -Dm644 "share/doc/malgel/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
