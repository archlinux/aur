# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com> 
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=matthart1983
_gitname=syswatch
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Single-host system diagnostics TUI"

pkgver=0.14.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64-static' 'linux-aarch64-static')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}.tar.gz")
sha256sums=('bb31263561365f7db9e7d13935990a7793fd4b4ec759950c0ef5101d9a57414c'
            'e78d969849862ac5abf431de8929c62759311a0cc58fd404eaf30996ab3f9162')
sha256sums_x86_64=('19226bf342dfc05aeddebd275207ab9c73942a57014e9b3ffc124f46bdfcdb3e')
sha256sums_aarch64=('dbb42cb5f7a81745669df949750aa7cb7bdbd9eba5f9e4729d43355806b74f09')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${_CARCH}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
