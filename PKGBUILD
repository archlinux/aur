# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Monirzadeh aur.phantom634 at passinbox dot com

_gitauthor=chapar-rest
_gitname=chapar
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A simple and easy to use api testing tools aims to help developers to test their api endpoints. It support http and grpc protocols."

pkgver=0.10.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('BSD-3-Clause')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libx11' 'libxkbcommon' 'libxkbcommon-x11' 'libxcursor' 'libxfixes' 'libglvnd' 'wayland')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-linux-${_gitversion}-${_barch[0]}.tar.xz")
sha256sums=('2b1c690f77f3ecba6bdaeff74bc7190ce82934d556d7480683853741d9082d2b')
sha256sums_x86_64=('4732c2bdc96f441dc5c0280ba060171bf8fda58682c33ee41f35ef92ad85f5ee')


prepare() {
	cd "${srcdir}/" || exit

	sed -i -e "s#${_appname}.png#${_appname}#" "${srcdir}/desktop-assets/${_appname}.desktop"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "desktop-assets/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"

	install -Dm644 "appicon.png" "${pkgdir}/usr/share/icons/${_appname}.png"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
