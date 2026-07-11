# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=reekta92
_gitname=clin-rs
_appname=${_gitname%%-rs}
pkgname=${_gitname}-bin
pkgdesc="Encrypted terminal note-taking app"

pkgver=0.9.8
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%%-bin}")

depends=('glibc' 'libgcc')
optdepends=("graf")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}.tar.xz")
sha256sums_x86_64=('62187b2debe2df05a38a966d3e4364a010f2e24426d34da5edc728c701890647')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
