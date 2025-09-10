# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=horeah
_pkgname=PyCmd
pkgname=${_pkgname,,}-bin
pkgver=20250905
_pkgvername=${pkgver}
pkgrel=1
pkgdesc="Front-end for bash"
arch=('x86_64')
_barch=('linux64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('LGPL-3.0')

makedepends=('unzip')
depends=('glibc' 'bash' 'zlib')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)
noextract=("${_pkgname}-${CARCH}-${pkgver}.zip")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.zip")
sha256sums_x86_64=('220e91125c490195b6a92b5525f98e6e00407c76a212187ccc567d4654c8e1df')

prepare() {
	cd "${srcdir}/" || exit

	echo """[Desktop Entry]
Name=${_pkgname}
Type=Application
Comment=Front-end for bash
Exec=/usr/bin/${_pkgname}
Icon=/usr/share/icons/${_pkgname}.ico
Categories=System;TerminalEmulator;
Keywords=terminal;
StartupNotify=true
Terminal=true
""" > "${_pkgname}.desktop"
}

package() {
	cd "${srcdir}/" || exit

	install -d "${pkgdir}/opt/"
	unzip -q "${_pkgname}-${CARCH}-${pkgver}.zip" -d "${pkgdir}/opt/"

	install -d "${pkgdir}/usr/bin/"
	ln -sf "${pkgdir}/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -d "${pkgdir}/usr/share/icons/"
	ln -sf "${pkgdir}/opt/${_pkgname}/${_pkgname}.ico" "${pkgdir}/usr/share/icons/${_pkgname}.ico"

	install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
