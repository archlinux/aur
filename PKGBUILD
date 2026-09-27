# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=hsr88
_gitname=mouzi
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A free, privacy-first automatic file organizer that quietly sorts your Downloads folder from the system tray"

pkgver=0.2.1
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
sha256sums=('a708fc6797dc4b0f508272f064213760828d4a687eef8ad1c68febc89d4e7ee7'
            'e27f44e9a62cf3ec22d9e2fe734772fa1b96e24459c3a3fb3957797824c3b5d1')
sha256sums_x86_64=('ae47db65e7b10731a5bc0ebd97267589d131d939caa088a5c754a33838fa9394')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.gz"

	sed -e "s|Categories=|Categories=Utility;|g" -e "s|Comment=.*|Comment=Intelligent file organizer|g" -i "${pkgdir}/usr/share/applications/${_appname^}.desktop"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

