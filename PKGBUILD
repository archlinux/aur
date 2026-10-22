# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com> 
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=matthart1983
_gitname=syswatch
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Single-host system diagnostics TUI"

pkgver=0.14.4
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
sha256sums=('f442d0671a8f6f204d82f74e0639ef59c07979b4833f5aa3177a50126035f230'
            'e78d969849862ac5abf431de8929c62759311a0cc58fd404eaf30996ab3f9162')
sha256sums_x86_64=('45dda51b29c29439c1deeda24b768c4a6a01f7af342b6ca6504b165c974f9c1c')
sha256sums_aarch64=('d5b2565aa8059b60f8769a6fe56472d6222be653ec0d0923585842a6c667bce6')


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
