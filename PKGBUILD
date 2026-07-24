# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=here-Leslie-Lau
_gitname=zlist
_appname=zl
pkgname=${_gitname}-bin
pkgdesc="A modern ls alternative written in Zig"

pkgver=0.1.7
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
sha256sums=('470b580da04788da67dc684d3d6182b44b9f1cc7bf9beb46a631cf5d2dbaaa5f'
            '0cc8677757eeadbb8743f51a8a5302af7af538ea75c0b8e1b301d277d0280c08')
sha256sums_x86_64=('9f30df763dff8da935d86935526d050d3fe1d8b63f729764a3ddab1d30f691d3')
sha256sums_aarch64=('589f340010796f1d8d404cc890578ebf042aaf5cb2dfac3dd8e1dc8411683e6d')


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
