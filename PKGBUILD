# Contributor: Max Roder <maxroder@web.de>
# Contributor: Sebastian Jug <seb AT stianj DOT ug>
# Maintainer: Amirreza Firoozi <firoozi128 dot af at gmail dot com>
# To port this PKGBUILD to another language of tor-browser you 
# have to change $pkgname, $_language, $pkgdesc and $url in PKGBUILD
# AND (!) the first line in the .install file!

pkgname='tor-browser-en-ir'
pkgver='6.0.6'
_language='en-US'
pkgrel=1
pkgdesc='Tor Browser Bundle: Anonymous browsing using firefox and tor, exactly the same as the tor-browser-en but not filtered in Iran'
url='https://github.com/AmirrezaFiroozi/t0r-browser-en-IR'
arch=('x86_64' 'i686')
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
install="tor-browser-en.install"

validpgpkeys=('8738A680B84B3031A630F2DB416F061063FEE659'
              'EF6E286DDA85EA2A4BA7DE684E2C6E8793298290')

source_x86_64=("http://5.9.232.164/files/tor/${pkgver}/tor-browser-linux64-${pkgver}_${_language}.tar.xz")
source_i686=("http://5.9.232.164/files/tor/${pkgver}/tor-browser-linux32-${pkgver}_${_language}.tar.xz")

source+=("https://github.com/AmirrezaFiroozi/t0r-browser-en-IR/archive/V1.2.tar.gz")

sha256sums_x86_64=('bd765a778e3a30f912b251c30ec4f1f4db02f2babfb34090c59ab7ecef5cac79' )
sha256sums_i686=(  '9fb4a0142a6b2cf23d60983345f37f4090b047aa7c9e4145c0921fa2df7c1e61' )
sha256sums+=('1aa2ce913489af77fd46ed4d067f6a2a672e4746dccdfec2c466fe40c87722ff')

noextract_x86_64=("tor-browser-linux64-${pkgver}_${_language}.tar.xz")
noextract_i686=("tor-browser-linux32-${pkgver}_${_language}.tar.xz")

package() {
   cd "${srcdir}"
   cd "t0r-browser-en-IR-1.2/" 
   cp * ..
   cd "${srcdir}"
   rm -rf "t0r-browser-en-IR-1.2"
   sed -i "s/REPL_NAME/${pkgname}/g"       ${pkgname}.sh
   sed -i "s/REPL_VERSION/${pkgver}/g"	    ${pkgname}.sh
   sed -i "s/REPL_LANGUAGE/${_language}/g" ${pkgname}.sh

   sed -i "s/REPL_NAME/${pkgname}/g"       ${pkgname}.desktop
   sed -i "s/REPL_LANGUAGE/${_language}/g" ${pkgname}.desktop
   sed -i "s/REPL_COMMENT/${pkgdesc}/g"    ${pkgname}.desktop

   install -Dm 644 ${pkgname}.desktop      ${pkgdir}/usr/share/applications/${pkgname}.desktop
   install -Dm 644 ${pkgname}.png          ${pkgdir}/usr/share/pixmaps/${pkgname}.png
   install -Dm 755 ${pkgname}.sh           ${pkgdir}/usr/bin/${pkgname}

   if [[ "$CARCH" == 'i686' ]]; then
      install -Dm 644 tor-browser-linux32-${pkgver}_${_language}.tar.xz ${pkgdir}/opt/${pkgname}/tor-browser-linux32-${pkgver}_${_language}.tar.xz
   else
      install -Dm 644 tor-browser-linux64-${pkgver}_${_language}.tar.xz ${pkgdir}/opt/${pkgname}/tor-browser-linux64-${pkgver}_${_language}.tar.xz
   fi
}
