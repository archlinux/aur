# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=hsr88
_gitname=mouzi
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A free, privacy-first automatic file organizer that quietly sorts your Downloads folder from the system tray"

pkgver=0.1.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'glib2' 'libsoup3' 'gtk3' 'cairo' 'dbus' 'gdk-pixbuf2' 'webkit2gtk-4.1' 'hicolor-icon-theme')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname^}_${pkgver}_${_barch[0]}.deb")
sha256sums=('af28d183a7ee2405c326392fe438f4411723034f3af690ebbe1849da4c41ab4a'
            '350c0cea7c02cea8f0727845c3969b933608875cc3bae7280fa417b48b511c61')
sha256sums_x86_64=('c8a8333d0cdcb60b3ab32379909b692655fbbbe7306fed134c78adb1d85a4194')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.gz"

	sed -e "s|Categories=|Categories=Utility;|g" -e "s|Comment=.*|Comment=Intelligent file organizer|g" -i "${pkgdir}/usr/share/applications/${_appname^}.desktop"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

