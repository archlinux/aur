# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=t21dev
_gitname=porter-app
_appname=Porter
pkgname=${_gitname}-bin
pkgdesc="A sleek, fast, and secure desktop port monitoring application built with Tauri, React, and TypeScript"

pkgver=0.8.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'glib2' 'gtk3' 'libsoup3' 'gdk-pixbuf2' 'webkit2gtk-4.1' 'cairo' 'hicolor-icon-theme')

options=('!strip')

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.deb")
sha256sums=('3e6ec8b6bcef8ed4adeb55701eab79825d1dd5125f8bb0c8395131b32b0aff22')
sha256sums_x86_64=('93044ad1ee73bf7fa6f8539d16eb10b23713902e6f669c3bbf2c455c9205a9a1')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	sed -e "s|Categories=?*|Categories=System;Monitor;Network;|g" -e "s|Comment=.*|Comment=Port Monitor|g" -i ${pkgdir}/usr/share/applications/*.desktop
}
