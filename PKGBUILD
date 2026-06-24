# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=this-senda
_gitname=senda
_appname=${_gitname}
pkgname=${_appname}-bin
pkgtitle="API Client"
pkgdesc="Fast, lightweight, git-native API client"

pkgver=0.1.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}"{,-desktop})
conflicts=("${_appname}")

depends=('gtk4' 'glib2' 'libsoup3' 'webkitgtk-6.0')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
sha256sums=('815e1d2654dcedbc7c87e1801b82f2efa41bd4532aafd01151036f1d0e081e1d'
            '9be541594ab169eaf1bb278300d81a1fe2bf399980ca2505e978a225ba9d8e0e')
sha256sums_x86_64=('db53ff204ad28c13b4f4922577e4bcf68cabd07fdefb85b83262e9072a48a5f3')
sha256sums_aarch64=('db53ff204ad28c13b4f4922577e4bcf68cabd07fdefb85b83262e9072a48a5f3')


prepare() {
	echo """[Desktop Entry]
Name=${_appname^}
GenericName=${pkgtitle}
Comment=${pkgdesc}
Exec=${_appname}-desktop
Icon=${_appname}
Terminal=false
Type=Application
StartupWMClass=senda-desktop
Keywords=API;HTTP;REST;client;rest;
Categories=Development;Utility;""" > ${_appname}.desktop
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"
	install -Dm755 "${_appname}-desktop" "${pkgdir}/usr/bin/${_appname}-desktop"

	install -Dm644 "${_appname}.png" "${pkgdir}/usr/share/icons/${_appname}.png"

	install -Dm644 "${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
