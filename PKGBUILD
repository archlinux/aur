# Maintainer: end222 <pabloorduna98 at gmail dot com>
# Ex-Maintainer: Jean Lucas <jean at 4ray dot co>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

pkgname=tor-browser-dev-en
pkgver=7.5a5
_language='en-US'
pkgrel=1
pkgdesc="Tor Browser is +1 for privacy and -1 for mass surveillance"
arch=('i686' 'x86_64')
url="https://www.torproject.org/projects/torbrowser.html.en"
license=('GPL')
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite')
optdepends=('zenity: simple dialog boxes'
            'kdebase-kdialog: KDE dialog boxes'
            'gst-plugins-good: h.264 video'
            'gst-libav: h.264 video'
            'libpulse: PulseAudio audio driver'
            'libnotify: GNOME dialog boxes')
source_i686=("https://dist.torproject.org/torbrowser/${pkgver}/tor-browser-linux32-${pkgver}_${_language}.tar.xz"{,.asc})
source_x86_64=("https://dist.torproject.org/torbrowser/${pkgver}/tor-browser-linux64-${pkgver}_${_language}.tar.xz"{,.asc})
source+=(${pkgname}.desktop
         ${pkgname}.png
         ${pkgname}.sh)
sha256sums_i686=('3adaa978f8d33104f73255d4dd8a5e2efcd4702ccc1bd4c5a665e23706743e66'
                 'SKIP')
sha256sums_x86_64=('8cee4cc0f82463da782cf3e7817e0b72507e6b200b5cccd549fe9f7e77d1d90d'
                   'SKIP')
sha1sums+=('344ded68e188649c0d0347f8f675e006c36c03f1'
           'aa3f84762b5f0b39aea5e03befdb03c4f53e8078'
           '309aac05a0b0f022eda2f292fb572b523726409c')
validpgpkeys=('EF6E286DDA85EA2A4BA7DE684E2C6E8793298290'
	      'A4300A6BC93C0877A4451486D1483FA6C3C07136')
noextract_i686=("tor-browser-linux32-${pkgver}_${_language}.tar.xz")
noextract_x86_64=("tor-browser-linux64-${pkgver}_${_language}.tar.xz")

package() {
  cd ${srcdir}

  sed -i \
    -e "s|REPL_NAME|${pkgname}|g" \
    -e "s|REPL_VERSION|${pkgver}|g" \
    -e "s|REPL_LANGUAGE|${_language}|g" \
    ${pkgname}.sh

  sed -i \
    -e "s|REPL_LANGUAGE|${_language}|g" \
    -e "s|REPL_COMMENT|${pkgdesc}|g" \
    -e "s|REPL_NAME|${pkgname}|g" \
    ${pkgname}.desktop

  install -Dm 0644 ${pkgname}.desktop \
    ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm 0644 ${pkgname}.png \
    ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  install -Dm 0755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}

  if [ "$CARCH" == "i686" ]; then
    install -Dm 0644 tor-browser-linux32-${pkgver}_${_language}.tar.xz \
      ${pkgdir}/opt/${pkgname}/tor-browser-linux32-${pkgver}_${_language}.tar.xz
  else
    install -Dm 0644 tor-browser-linux64-${pkgver}_${_language}.tar.xz \
      ${pkgdir}/opt/${pkgname}/tor-browser-linux64-${pkgver}_${_language}.tar.xz
  fi
}
