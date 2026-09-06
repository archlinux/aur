# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Auto-Explore
_gitname=GitComet
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="The fastest open source user interface for GIT workflows"

pkgver=0.2.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url="https://gitcomet.dev/"

license=('AGPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'libgcc' 'git' 'zlib' 'libx11' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'hicolor-icon-theme')

options=('!strip')

source=("LAUNCHER-${pkgver}.desktop::${_ghurlraw}/assets/linux/${_appname}.desktop"
		"ICON-32-${pkgver}.png::${_ghurlraw}/assets/linux/hicolor/32x32/apps/${_appname}.png"
		"ICON-48-${pkgver}.png::${_ghurlraw}/assets/linux/hicolor/48x48/apps/${_appname}.png"
		"ICON-128-${pkgver}.png::${_ghurlraw}/assets/linux/hicolor/128x128/apps/${_appname}.png"
		"ICON-256-${pkgver}.png::${_ghurlraw}/assets/linux/hicolor/256x256/apps/${_appname}.png"
		"ICON-512-${pkgver}.png::${_ghurlraw}/assets/linux/hicolor/512x512/apps/${_appname}.png")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname,,}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname,,}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('51861511cc1b27c83057c61c62139e877b7d42dee861c1dd7c84b6035588130c'
            '8b649b4a1f91c26f4b55e44d64c48d6e6d69f3afc0c338fbb0d6830682ddd094'
            'adaa57ca8e12077f4497e10df03fb15f1175747ead9327703608bb2b037236bd'
            '5b37a2ac27ed747c62bc3d1aa9bdbffbee613954f2468c2eb4166710fbe491ea'
            '38a4776d0b425a2ca34656fc62ece9b52a8eeb48791c994064829057ffa6d67b'
            '7a75ee64acc3fc0d0a69450c8d0313527a937d4ffb78aeeb2d7d40b5f83e6d98')
sha256sums_x86_64=('60b03ee1b8ee9f18b674eed8e3a69f3ffacf8c6a3237ad6a39482529e8c2b614')
sha256sums_aarch64=('1c508b3bc89296f97ab2aee1bc17a2032c96cfbcd899c63de625fde4bc79f56f')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

_extracted_folder="${_gitname,,}-${_gitversion}-${_CARCH}"

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_extracted_folder}/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LAUNCHER-${pkgver}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"

	install -Dm644 "ICON-32-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_appname}.png"
	install -Dm644 "ICON-48-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${_appname}.png"
	install -Dm644 "ICON-128-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_appname}.png"
	install -Dm644 "ICON-256-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_appname}.png"
	install -Dm644 "ICON-512-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png"

	install -Dm644 "${_extracted_folder}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${_extracted_folder}/NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${_extracted_folder}/LICENSE-AGPL-3.0" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
