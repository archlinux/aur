# Maintainer: Mike Tigas <mike at tig dot as>
# Ex-Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Ex-Maintainer: end222 <pabloorduna98 at gmail dot com>
# Ex-Maintainer: Jean Lucas <jean at 4ray dot co>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

pkgname=tor-browser-dev
pkgver=8.5a11
_language='en-US'
pkgrel=1
pkgdesc="Tor Browser Bundle (version)"
arch=('i686' 'x86_64')
url="https://www.torproject.org/download/alpha/"
license=('GPL')
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite')
optdepends=('zenity: simple dialog boxes'
            'kdialog: KDE dialog boxes'
            'gst-plugins-good: H.264 video'
            'gst-libav: H.264 video'
            'libpulse: PulseAudio audio driver'
            'libnotify: Gnome dialog boxes')
source_i686=("https://dist.torproject.org/torbrowser/${pkgver}/tor-browser-linux32-${pkgver}_${_language}.tar.xz"{,.asc})
source_x86_64=("https://dist.torproject.org/torbrowser/${pkgver}/tor-browser-linux64-${pkgver}_${_language}.tar.xz"{,.asc})
source+=(${pkgname}.desktop
         ${pkgname}.png
         ${pkgname}.sh)
sha256sums=('13d2e1fe85a9a08e9f66116f3c2d6f1e5d37e07d2ad8b08ae4f01890e864a722'
            '4f01e363738e36dc41ca431fbbf5a00b014dc37e2c9a3cfaf2ce182103a1d068'
            'ce19dd89a8ecd9289136f97f0122b7301bdda9bcf0208f4277817e23ea9a95d8')
sha256sums_i686=('190e2969d2e485372592348223d1109cf0778a77a018a6f15b70ca00d215c233'
                 'SKIP')
sha256sums_x86_64=('5b9d7d93d9ac4612b74c3e95f4ae94b8faa2329d6409e90a633dcb9516090db5'
                   'SKIP')
validpgpkeys=('EF6E286DDA85EA2A4BA7DE684E2C6E8793298290'
	      'A4300A6BC93C0877A4451486D1483FA6C3C07136')
noextract=("tor-browser-linux32-${pkgver}_${_language}.tar.xz"
	   "tor-browser-linux64-${pkgver}_${_language}.tar.xz")

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
