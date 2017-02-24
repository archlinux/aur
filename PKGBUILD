# Maintainer: Jean Lucas <jean at 4ray dot co>
# Contributor: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Max Roder <maxroder at web dot de>

pkgname=tor-browser-bin
pkgver=6.5
_language='en-US'
pkgrel=2
pkgdesc="Tor Browser is +1 for privacy and -1 for mass surveillance"
arch=('i686' 'x86_64')
url="https://github.com/triceratops1/TBB4Arch"
license=('GPL')
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite')
optdepends=('zenity: simple dialog boxes'
            'kdialog: KDE dialog boxes'
            'gst-plugins-good: h.264 video'
            'gst-libav: h.264 video'
            'libpulse: PulseAudio audio driver'
            'libnotify: GNOME dialog boxes')
source_i686=("https://dist.torproject.org/torbrowser/${pkgver}/tor-browser-linux32-${pkgver}_${_language}.tar.xz"{,.asc})
source_x86_64=("https://dist.torproject.org/torbrowser/${pkgver}/tor-browser-linux64-${pkgver}_${_language}.tar.xz"{,.asc})
source+=(tor-browser.desktop
         tor-browser.png
         tor-browser.sh)
sha256sums_i686=('6942bfcb61710b5ad49d7142c8d5f68b945d115dd1554dd4a1c6b0739fe83af8'
                 'SKIP')
sha256sums_x86_64=('c4714061748a70d3871dd84ff88d2f317b386d290a5c1fb94a504a1c256f1960'
                   'SKIP')
sha512sums+=('3bb1b255b75178bf8b002e3e7da448c5b6427561fce6552f95ffdd00f75755a916a5f0057440917eece52f164d9ddf1cbb6ba91f2430553a73c94cf23d6a7618'
           '236338469e13b4991c2abb94d4844d0149bb98094f1661b0a41256df0400cfe9904882117aae9edbea9261d99aea42745e03d745b523243d9a75fa5151062e18'
           '54ba3df337f07b3072636bf42b255de26eddde773e82f7588c4ed9cf29c20ea5522c460855151036dad307dc023c76266e57f530352bb129b6afef95bf28c038')
validpgpkeys=('8738A680B84B3031A630F2DB416F061063FEE659'
              'EF6E286DDA85EA2A4BA7DE684E2C6E8793298290')
noextract_i686=("tor-browser-linux32-${pkgver}_${_language}.tar.xz")
noextract_x86_64=("tor-browser-linux64-${pkgver}_${_language}.tar.xz")

package() {
  cd $srcdir

  sed -i \
    -e "s|REPL_VERSION|${pkgver}|g" \
    -e "s|REPL_LANGUAGE|${_language}|g" \
    tor-browser.sh

  sed -e "s|REPL_COMMENT|${pkgdesc}|g" tor-browser.desktop

  install -Dm 0644 tor-browser.desktop \
    $pkgdir/usr/share/applications/tor-browser.desktop
  install -Dm 0644 tor-browser.png \
    $pkgdir/usr/share/pixmaps/tor-browser.png
  install -Dm 0755 tor-browser.sh $pkgdir/usr/bin/tor-browser

  if [ "$CARCH" == "i686" ]; then
    install -Dm 0644 tor-browser-linux32-${pkgver}_${_language}.tar.xz \
      $pkgdir/opt/tor-browser/tor-browser-linux32-${pkgver}_${_language}.tar.xz
  else
    install -Dm 0644 tor-browser-linux64-${pkgver}_${_language}.tar.xz \
      $pkgdir/opt/tor-browser/tor-browser-linux64-${pkgver}_${_language}.tar.xz
  fi
}
