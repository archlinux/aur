# Maintainer: vitamin1980 <vitamin.novgorod @ yandex.ru>

pkgname='tor-browser-ru'
pkgver='7.0'
_language='ru'
pkgrel=1
pkgdesc='Tor Browser Bundle: Anonymous browsing using firefox and tor'
url='https://www.torproject.org/projects/torbrowser.html.en'
arch=('x86_64' 'i686')
license=('GPL')
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite')
optdepends=('zenity: simple dialog boxes'
            'kdialog: KDE dialog boxes'
            'gst-plugins-good: h.264 video'
            'gst-libav: h.264 video'
            'libpulse: PulseAudio audio driver'
            'libnotify: Gnome dialog boxes')
install="${pkgname}.install"

source_x86_64=("https://www.torproject.org/dist/torbrowser/${pkgver}/tor-browser-linux64-${pkgver}_${_language}.tar.xz")
source_i686=("https://www.torproject.org/dist/torbrowser/${pkgver}/tor-browser-linux32-${pkgver}_${_language}.tar.xz")
source=("${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")

sha256sums_x86_64=('364feec77d3c06a400bbf9b64f7615477aa9adc6c3317d63396675b8ab6715fb')
sha256sums_i686=('78a88a5a5dc4de6f8e09c8152fc5d8af9d4477f2ca278603e5a762a822c09dba')
sha256sums=('3d5fc01f2cfbae0a00b7117b0b0a24028d1686e6f81a347809f74de2d8522ff7'
            '17fc2f5784d080233aca16e788d62ab6fe3e57cf781b123cfe32767de97d6d3b'
            '1e5c48a957de2df3470c82873b59663fb2b682dfc38a53d508002e59f53effaa')

noextract=("tor-browser-linux${_pkgarch}-${pkgver}_${_language}.tar.xz")

# Workaround due to different versions depending on CARCH
if [[ "$CARCH" == 'i686' ]]; then
	_pkgarch='32'
else
	_pkgarch='64'
fi

package() {
	cd "${srcdir}"

	sed -i "s/REPL_NAME/${pkgname}/g"			${pkgname}.sh
	sed -i "s/REPL_VERSION/${pkgver}/g"	${pkgname}.sh
	sed -i "s/REPL_LANGUAGE/${_language}/g"		${pkgname}.sh

	sed -i "s/REPL_NAME/${pkgname}/g"			${pkgname}.desktop
	sed -i "s/REPL_LANGUAGE/${_language}/g"		${pkgname}.desktop
	sed -i "s/REPL_COMMENT/${pkgdesc}/g"		${pkgname}.desktop

	install -Dm 644 ${pkgname}.desktop	${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm 644 ${pkgname}.png		${pkgdir}/usr/share/pixmaps/${pkgname}.png
	install -Dm 755 ${pkgname}.sh		${pkgdir}/usr/bin/${pkgname}

	install -Dm 644 tor-browser-linux${_pkgarch}-${pkgver}_${_language}.tar.xz ${pkgdir}/opt/${pkgname}/tor-browser-linux${_pkgarch}-${pkgver}_${_language}.tar.xz
}

