# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=runyte
_gitname=runyte
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="An editor-first, agent-ready terminal workspace for software development"

pkgver=0.3.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MPL-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source=("USER-GUIDE-${pkgver}.md::${_ghurlraw}/docs/user-guide.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.xz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.xz")
sha256sums=('82acc68d199869f56222bb4ba1fed64909e90ad70b718a14f41cbb312d38f3d1')
sha256sums_x86_64=('0418d631dfc09ea3b01c572809c2e84db702bda0924de0c682d51f42e249fefa')
sha256sums_aarch64=('fd309d71ce427c63d7984b669bb4a23477332e45acfa1c85bbab8b8c08986138')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "config.example.yaml" "${pkgdir}/usr/share/doc/${pkgname}/config/config.example.yaml"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "../USER-GUIDE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/USER-GUIDE.md"

	install -Dm644 "NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
