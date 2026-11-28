# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=quanticstudios
_gitname=pitwall
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A desktop terminal for running several coding agents at once, with a sidebar that shows what each one is doing right now"

pkgver=0.3.17
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('libx11' 'libxkbcommon' 'libxkbcommon-x11' 'libxfixes' 'libxcursor' 'wayland' 'libglvnd' 'hicolor-icon-theme')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
sha256sums=('6bb8e506b9d2a1d2b61184c01dfb13a55b7d08654ff28654eadf9857ca60bfe0')
sha256sums_x86_64=('3046a4f3413dae202858ae711a673e974c72beac1d71881b6ac83ff14b1225ea')
sha256sums_aarch64=('3e1b406bbe9ddb359b5c303728b9192f3e0c68820e02e9e8db3d1a9882b0e145')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"

	install -Dm644 "${_appname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "THIRD_PARTY_NOTICES.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
