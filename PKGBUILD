# Maintainer: Jean Lucas <jean at 4ray dot co>
# Contributor: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Max Roder <maxroder at web dot de>

pkgname=tor-browser-bin
pkgver=6.0.6
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
sha256sums_i686=('9fb4a0142a6b2cf23d60983345f37f4090b047aa7c9e4145c0921fa2df7c1e61'
                 'SKIP')
sha256sums_x86_64=('bd765a778e3a30f912b251c30ec4f1f4db02f2babfb34090c59ab7ecef5cac79'
                   'SKIP')
sha1sums+=('922f966fa16ba30a01b8e8d6f44ddb0b5468725d'
           'aa3f84762b5f0b39aea5e03befdb03c4f53e8078'
           'e55d123744b57e23a02319243d64c24911a38e29')
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
