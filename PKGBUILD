# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=here-Leslie-Lau
_gitname=zlist
_appname=zl
pkgname=${_gitname}-bin
pkgdesc="A modern ls alternative written in Zig"

pkgver=0.1.11
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
sha256sums=('1d2b8099ec85648c85226c049313273f2a96898e1d806014eed31fe7056b8e39'
            '0cc8677757eeadbb8743f51a8a5302af7af538ea75c0b8e1b301d277d0280c08')
sha256sums_x86_64=('546e1f45d3875afd4070fd0fcbcb9bb7c5af6044c4c8ce9a37644077bd630ca1')
sha256sums_aarch64=('c99370840356aa282d9912bddacef9f017d796bb10276d4ba02be13550c93aca')


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
