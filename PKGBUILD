# Maintainer: Jean Lucas <jean at 4ray dot co>
# Contributor: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Max Roder <maxroder at web dot de>

pkgname=tor-browser-bin
pkgver=6.0.2
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
source+=(tor-browser.desktop
         tor-browser.png
         tor-browser.sh)
sha256sums_i686=('8f75481ca5dbe93b25a9eac3d3d3cecd0b1dc3c2566ecb244cf2af065d6c4d18'
                 'SKIP')
sha256sums_x86_64=('dd805f7cfcba18624ed1d70529c8e850b58cd66b4c7bc259a16ce6d0a298f123'
                   'SKIP')
sha512sums+=('eaa9f60d8b6343253c12c2438f3a6b805768b407ec43c34e88780ceec6a6f853c13b56749bccd73d7183402fd490a68c61de356728531744ca3b2f744fc92ffe'
             '236338469e13b4991c2abb94d4844d0149bb98094f1661b0a41256df0400cfe9904882117aae9edbea9261d99aea42745e03d745b523243d9a75fa5151062e18'
             '54ba3df337f07b3072636bf42b255de26eddde773e82f7588c4ed9cf29c20ea5522c460855151036dad307dc023c76266e57f530352bb129b6afef95bf28c038')
validpgpkeys=('8738A680B84B3031A630F2DB416F061063FEE659'
              'EF6E286DDA85EA2A4BA7DE684E2C6E8793298290')
noextract_i686=("tor-browser-linux32-${pkgver}_${_language}.tar.xz")
noextract_x86_64=("tor-browser-linux64-${pkgver}_${_language}.tar.xz")

package() {
  cd ${srcdir}

  sed -i \
    -e "s|REPL_VERSION|${pkgver}|g" \
    -e "s|REPL_LANGUAGE|${_language}|g" \
    tor-browser.sh

  install -Dm 0644 tor-browser.desktop \
    ${pkgdir}/usr/share/applications/tor-browser.desktop
  install -Dm 0644 tor-browser.png \
    ${pkgdir}/usr/share/pixmaps/tor-browser.png
  install -Dm 0755 tor-browser.sh ${pkgdir}/usr/bin/tor-browser

  if [ '$CARCH' == 'i686' ] ; then
    install -Dm 0644 tor-browser-linux32-${pkgver}_${_language}.tar.xz \
      ${pkgdir}/opt/tor-browser/tor-browser-linux32-${pkgver}_${_language}.tar.xz
  else
    install -Dm 0644 tor-browser-linux64-${pkgver}_${_language}.tar.xz \
      ${pkgdir}/opt/tor-browser/tor-browser-linux64-${pkgver}_${_language}.tar.xz
  fi
}
