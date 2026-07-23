# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Architeg
_gitname=gloss
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A local-first command glossary for your terminal"

pkgver=0.1.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.zip")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.zip")
sha256sums=('8ee71004b389beec9bf93a5d4a1675d6166e446d82b4f327cadcd3138162dfdf'
            '3226c2acd5b7575f4880cfb2fecc37b06beaa608aad8ba22fa085f8a976fea3c')
sha256sums_x86_64=('37e8a005413f1aaaf66acee1fe2969b8cd7249e29cbe088593243bfdc1b9b096')
sha256sums_aarch64=('1e72599168d59993ea7c764ea72e52aec9734dfa1759d5678fbcad8b7cd8ec81')


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
