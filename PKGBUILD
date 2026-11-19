# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=akiyosi
_gitname=zonvie
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="🧟 Zonvie is a Fast, feature-rich Neovim GUI"

pkgver=0.4.5
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

depends=('neovim' 'harfbuzz' 'glib2' 'libxkbcommon' 'libglvnd' 'wayland' 'freetype2' 'fontconfig' 'hicolor-icon-theme')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('ba6b21546949b5967deefc31198714849cb339a5f32f75ed18a66f5b729909ad'
            '2d88afc70c716ff40f002f6a274da2b58798408a3d08f1b83d0b20d56ca956d0')
sha256sums_x86_64=('957d3293184323af9f44f9c40002312ad860ddb6e3f341fabc0cf95145e0b778')
sha256sums_aarch64=('230566a5c6f259beb88286ba4ed315f78f8352ab9b0d54e1bd0c0a56d27a6d82')


case ${CARCH} in
	${arch[0]})
		_CARCH=${_barch[0]}
	;;

	${arch[1]})
		_CARCH=${_barch[1]}
	;;
esac

package() {
	cd "${srcdir}/${_gitname}-${_gitversion}-${_CARCH}/" || exit

	install -Dm755 bin/${_appname} -t "${pkgdir}/usr/bin/"

	install -Dm644 share/applications/*.desktop -t "${pkgdir}/usr/share/applications/"
	install -Dm644 share/icons/hicolor/256x256/apps/*.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"

	install -Dm644 "../README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "../LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
