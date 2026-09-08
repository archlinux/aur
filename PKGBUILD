# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=here-Leslie-Lau
_gitname=zlist
_appname=zl
pkgname=${_gitname}-bin
pkgdesc="A modern ls alternative written in Zig"

pkgver=0.1.15
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
sha256sums=('e25a65cd5229e2022d25f31f07c3ac5b51ff7ba59554cf1e63b0a00d7f8c4cac'
            '0cc8677757eeadbb8743f51a8a5302af7af538ea75c0b8e1b301d277d0280c08')
sha256sums_x86_64=('41b8592e987c20e74b2ac022a8c48b48f6796d4ee1b152d4ca7d9c07fb12d157')
sha256sums_aarch64=('4d4c877a0b31de3a33b97cf6b1dfb424960748dd7d40d61f0118554b4664214f')


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
