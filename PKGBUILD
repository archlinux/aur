# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=masshirodev
_gitname=ranma
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A tiling window manager for the terminal: i3's tree, Hyprland's dwindle, configured in Lua"

pkgver=0.3.0
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
optdepends=('git: hako, the plugin manager, clones itself on the first start'
            'wl-clipboard: paste_image on Wayland'
            'xclip: paste_image on X11'
            'openssh: pasting files into a pane that runs ssh'
            'xdg-utils: opening links from hint mode')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums_x86_64=('93f18237cb55271dda7216095aed5ff99699a5abeec7829bf8ce17c70c1beea7')


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
