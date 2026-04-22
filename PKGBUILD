# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=matthart1983
_gitname=netwatch
_appname=${_gitname}
pkgname="${_appname}-tui-bin"
pkgdesc="Real-time network diagnostics TUI — like htop for your network"

pkgver=0.12.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64-static' 'linux-aarch64-static')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url="${_ghurl}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}-tui")

depends=('libpcap')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('457276f3c24bad36cd46f3dea6cd1f9f43ed45ee6eb8c5e6b67a82fd34b8ae0f'
            '25f1837fb575f27ff0b53bea961fb5e3a6282cec74646aa7cc638ebd0f725545')
sha256sums_x86_64=('d7696e8425ee52e09bf426bb4569b9b62cfb490cee3fb99daa810fdf131ddcaa')
sha256sums_aarch64=('8e525b44d4cf71ce66ecaed05632d29ee3126cbe4d464c15f59e73132c8b84e5')


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
