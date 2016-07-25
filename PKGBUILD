# Maintainer: NextHendrix <cjones12@sheffield.ac.uk>

pkgname=tor-browser-hardened
pkgver=6.5a1
pkgrel=1
pkgdesc='Tor Browser Bundle: Anonymous browsing using firefox and tor (Hardened)'
url='https://www.torproject.org/projects/torbrowser.html.en'
arch=('x86_64')
license=('GPL')
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite')
optdepends=('zenity: simple dialog boxes'
'kdebase-kdialog: KDE dialog boxes'
'gst-plugins-good: h.264 video'
'gst-libav: h.264 video'
'libpulse: PulseAudio audio driver'
'libnotify: Gnome dialog boxes')
install="${pkgname}.install"

validpgpkeys=('8738A680B84B3031A630F2DB416F061063FEE659'
'EF6E286DDA85EA2A4BA7DE684E2C6E8793298290')
source_x86_64=("https://dist.torproject.org/torbrowser/${pkgver}-hardened/tor-browser-linux64-${pkgver}-hardened_ALL.tar.xz"{,.asc})
source+=("${pkgname}.desktop"
"${pkgname}.png"
"${pkgname}.sh")

sha256sums=('3d5fc01f2cfbae0a00b7117b0b0a24028d1686e6f81a347809f74de2d8522ff7'
'17fc2f5784d080233aca16e788d62ab6fe3e57cf781b123cfe32767de97d6d3b'
'53b8802862bc81c9f701670256dc35a1424de903106d7ece3cc985ccc5f05214')
sha256sums_x86_64=('15e41f5886a7adb3621ef48b165ee32152a6bc13dc80ab9b0dda15e8bc29d817'
'SKIP')

noextract_x86_64=("tor-browser-linux64-${pkgver}-hardened_ALL.tar.xz")

package() {
cd "${srcdir}"

sed -i "s/REPL_NAME/${pkgname}/g" ${pkgname}.sh
sed -i "s/REPL_VERSION/${pkgver}/g"	 ${pkgname}.sh
sed -i "s/REPL_LANGUAGE/${_language}/g" ${pkgname}.sh

sed -i "s/REPL_NAME/${pkgname}/g" ${pkgname}.desktop
sed -i "s/REPL_LANGUAGE/${_language}/g" ${pkgname}.desktop
sed -i "s/REPL_COMMENT/${pkgdesc}/g" ${pkgname}.desktop

install -Dm 644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
install -Dm 644 ${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
install -Dm 755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}

install -Dm644 tor-browser-linux64-${pkgver}-hardened_ALL.tar.xz ${pkgdir}/opt/${pkgname}/tor-browser-linux64-${pkgver}-hardened_ALL.tar.xz
}
