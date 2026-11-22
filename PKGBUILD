# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=quanticstudios
_gitname=pitwall
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A desktop terminal for running several coding agents at once, with a sidebar that shows what each one is doing right now"

pkgver=0.3.2
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
sha256sums=('d2023e36dfc43395651d392088cfb4d858b9d8deafb1acb00423263b6e7f2f11')
sha256sums_x86_64=('f9fa0af1f0626291f6a9b7a2b141e392b1beee4c55469f97b1ff8748428c0c56')
sha256sums_aarch64=('533cd914a8d7ad11fc43b08bff081bb27ad35bfa37a076ba2c89160bd1090b58')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"

	install -Dm644 "${_appname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "THIRD_PARTY_NOTICES.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
