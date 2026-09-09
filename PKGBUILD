# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=runyte
_gitname=runyte
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="An editor-first, agent-ready terminal workspace for software development"

pkgver=0.2.2
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
sha256sums=('27c231261c7632b1c007e546fc3af5a27bd8067cd98b2e8143748e8567d69cd6')
sha256sums_x86_64=('ffa84517f5922e358d91d7c6ac31757c75ef4795e9f78893722ac0b909eecf90')
sha256sums_aarch64=('644027ce39fdd02e1ec20101373eb8ac0c0a7358a2b1280516c35129f8b4fb51')


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
