# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=msavox
_gitname=cleecode
_appname=${_gitname%code}
pkgname=${_gitname}-bin
pkgdesc="A terminal IDE written in Rust"

pkgver=0.15.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('5945372728dcd546f5b23947a04e1bc6731de25657e5b21d3fb94537dc9b3063')
sha256sums_aarch64=('9fbdf131f66d286fe85c738fe83a91b7faf568f10dcd29cd67fa29073a183abc')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_appname}-${_gitversion}-${_CARCH}/" || exit

	install -Dm755 ${_appname} -t "${pkgdir}/usr/bin/"

	install -Dm644 ${_appname}.1 -t "${pkgdir}/usr/share/man/man1/"

	install -Dm644 fonts/*.ttf -t "${pkgdir}/usr/share/fonts/TTF/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
