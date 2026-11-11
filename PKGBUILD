# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=here-Leslie-Lau
_gitname=zlist
_appname=zl
pkgname=${_gitname}-bin
pkgdesc="A modern ls alternative written in Zig"

pkgver=0.1.17
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-linux-gnu' 'aarch64-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('fb219f19a0ee2a0415838ec6c650e2a7d709db4d21d609a68565369ba023d955'
            '0cc8677757eeadbb8743f51a8a5302af7af538ea75c0b8e1b301d277d0280c08')
sha256sums_x86_64=('eeb5837eb353990d744077ded5fbd6f7a4ee18ed8154a6bbfa58539cc7be2970')
sha256sums_aarch64=('d060aea2320d7c831e70ac296762a8f4f150033ad93f50b0effeaca6dcd1bf4b')


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
