# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=masshirodev
_gitname=ranma
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A tiling window manager for the terminal: i3's tree, Hyprland's dwindle, configured in Lua"

pkgver=0.2.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0' 'MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums_x86_64=('77b6432594dc836f9ad054f9434ef06d36b903e8b246cbd0690541d2fa03bbe4')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/${_appname}-${pkgver}-${_barch[0]}/" || exit

	install -Dm755 ${_appname} -t "${pkgdir}/usr/bin/"

	install -dm755 "${pkgdir}/usr/share/man/"
	cp -rfa man/man* "${pkgdir}/usr/share/man/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
