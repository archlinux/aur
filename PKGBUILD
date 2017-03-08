# Maintainer: Jean Lucas <jean at 4ray dot co>
# Contributor: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Max Roder <maxroder at web dot de>

pkgname=tor-browser-bin
pkgver=6.5.1
_language='en-US'
pkgrel=1
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
sha512sums=('3bb1b255b75178bf8b002e3e7da448c5b6427561fce6552f95ffdd00f75755a916a5f0057440917eece52f164d9ddf1cbb6ba91f2430553a73c94cf23d6a7618'
            '236338469e13b4991c2abb94d4844d0149bb98094f1661b0a41256df0400cfe9904882117aae9edbea9261d99aea42745e03d745b523243d9a75fa5151062e18'
            '54ba3df337f07b3072636bf42b255de26eddde773e82f7588c4ed9cf29c20ea5522c460855151036dad307dc023c76266e57f530352bb129b6afef95bf28c038')
sha512sums_i686=('d5cc5fdfcdf639655d764eb8f99b11a99eda1b8f2439be06ed5a200dcb37f4997a47764c1fe8bceecc5ce53a665b1ed4f41fc8c26ee239ac903556844510a1da'
                 'SKIP')
sha512sums_x86_64=('32e26f6d2cac8a8741c44501bd9ea91e577878c37a82f3b256c8da6a3997170534a137243270947c696a995e00dd3f5bb049f475534b85a5b2db9fed53534b2c'
                   'SKIP')
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
