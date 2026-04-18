# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=matthart1983
_gitname=netwatch
_appname=${_gitname}
pkgname=${_appname}-tui-bin
pkgdesc="Real-time network diagnostics TUI — like htop for your network"

pkgver=0.12.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64-static' 'linux-aarch64-static')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}-tui")

depends=('libpcap')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('42ef98d93306ebaac0f599ba00f0e6be9a559b3ab2a1151f172f15ca15ee0de4'
            '25f1837fb575f27ff0b53bea961fb5e3a6282cec74646aa7cc638ebd0f725545')
sha256sums_x86_64=('78e7a66950e253a63422f8737bc8100d5b5476533facd4e331ddbcdcbc86e99f')
sha256sums_aarch64=('a642fe61c2ba80d557340b757811efd845c01af493dd9f6fdf021b8a58aa0c7c')


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
