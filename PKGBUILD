# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Max Roder <maxroder@web.de>

# To port this PKGBUILD to another language of tor-browser you 
# have to change $pkgname, $_language, $pkgdesc and $url in PKGBUILD
# AND (!) the first line in the .install file!

pkgname='tor-browser-en'
pkgver='4.0.6'
_language='en-US'
pkgrel=1
pkgdesc='Tor Browser Bundle: Anonymous browsing using firefox and tor'
url='https://www.torproject.org/projects/torbrowser.html.en'
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
install="${pkgname}.install"

validpgpkeys=('8738A680B84B3031A630F2DB416F061063FEE659'
              'EF6E286DDA85EA2A4BA7DE684E2C6E8793298290')
source_x86_64=("https://www.torproject.org/dist/torbrowser/${pkgver}/tor-browser-linux64-${pkgver}_${_language}.tar.xz"
               "https://www.torproject.org/dist/torbrowser/${pkgver}/tor-browser-linux64-${pkgver}_${_language}.tar.xz.asc")
source_i686=("https://www.torproject.org/dist/torbrowser/${pkgver}/tor-browser-linux32-${pkgver}_${_language}.tar.xz"
             "https://www.torproject.org/dist/torbrowser/${pkgver}/tor-browser-linux32-${pkgver}_${_language}.tar.xz.asc")
source+=("${pkgname}.desktop"
         "${pkgname}.png"
         "${pkgname}.sh")

sha256sums_x86_64=('d954510bf812f624945bdba8e1c37e23573de89e2f159d7c89a3e3589a765559'
                   '67653aecfab4e9e0f6d0d2f534e5fabe24a6373c1149add2679fcad5ee195c72')
sha256sums_i686=('89ce71312f5d73fc2af637a93d7697587b2132fce0e9f6e815b25ddba66518d0'
                 'cd1921ee89bcecee2b0a2fe2350a7c63096fa6876dc8e43f421e0e93f6b38138')
sha256sums+=('3d5fc01f2cfbae0a00b7117b0b0a24028d1686e6f81a347809f74de2d8522ff7'
             '17fc2f5784d080233aca16e788d62ab6fe3e57cf781b123cfe32767de97d6d3b'
             'c2303d3e85265fd2b5cad64187558841e7088dcdaf6dd957a5a48ce0ba003934')

noextract_x86_64=("tor-browser-linux64-${pkgver}_${_language}.tar.xz")
noextract_i686=("tor-browser-linux32-${pkgver}_${_language}.tar.xz")

package() {
   cd "${srcdir}"

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
