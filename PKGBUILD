# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>
# Maintainer (English version): Max Roder <maxroder@web.de>

pkgname=tor-browser-es
_language=es-ES
pkgver=5.5.5
pkgrel=1
pkgdesc="Tor Browser Bundle: Navegación anónima utilizando Firefox y Tor"
arch=('i686' 'x86_64')
url="https://www.torproject.org/projects/torbrowser.html"
license=('GPL')
depends=('alsa-lib' 'dbus-glib' 'desktop-file-utils' 'gtk2' 'hicolor-icon-theme'
         'hunspell' 'icu' 'libevent' 'libvpx' 'libxt' 'mime-types'
         'mozilla-common' 'nss' 'sqlite' 'startup-notification')
optdepends=('kdebase-kdialog: KDE dialog boxes'
            'libnotify: Gnome dialog boxes'
            'zenity: simple dialog boxes'
            'gst-libav: h.264 video'
            'gst-plugins-good: h.264 video'
            'libpulse: PulseAudio audio driver')
install=$pkgname.install
validpgpkeys=('EF6E286DDA85EA2A4BA7DE684E2C6E8793298290')

source_x86_64=("https://dist.torproject.org/torbrowser/$pkgver/tor-browser-linux64-${pkgver}_${_language}.tar.xz"{,.asc})
source_i686=("https://dist.torproject.org/torbrowser/$pkgver/tor-browser-linux32-${pkgver}_${_language}.tar.xz"{,.asc})
source+=("$pkgname.desktop"
         "$pkgname.png"
         "$pkgname.sh")

sha256sums_x86_64=('a8cacca827ef88d80892c72ee09550afb118cb73d71d54d15ace074fe09368f3' 'SKIP')
sha256sums_i686=('08a0f228aaa24439b0eddddadf3a98eb30ad4360c2dd29c1f119bad2fd10c2f1' 'SKIP')
sha1sums=('28e65f7537e7dc76af475166365ad0deabb91cb9'
          '7a283313a21bb9cd8331891f99d2646186231636'
          'd4da2996d4b99d847a9ed382401b9f41cea4098b')

noextract_x86_64=("tor-browser-linux64-${pkgver}_${_language}.tar.xz")
noextract_i686=("tor-browser-linux32-${pkgver}_${_language}.tar.xz")

package() {
  cd "$srcdir"

  sed -i "s/REPL_NAME/$pkgname/g"       $pkgname.sh
  sed -i "s/REPL_LANGUAGE/$_language/g" $pkgname.sh
  sed -i "s/REPL_VERSION/$pkgver/g"     $pkgname.sh

  sed -i "s/REPL_NAME/$pkgname/g"       $pkgname.desktop
  sed -i "s/REPL_COMMENT/$pkgdesc/"     $pkgname.desktop
  sed -i "s/REPL_LANGUAGE/$_language/"  $pkgname.desktop

  install -Dm755 $pkgname.sh      "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.png     "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

  if [[ "$CARCH" == 'i686' ]]; then
    install -Dm644 tor-browser-linux32-${pkgver}_${_language}.tar.xz \
      "$pkgdir/opt/$pkgname/tor-browser-linux32-${pkgver}_${_language}.tar.xz"
  else
    install -Dm644 tor-browser-linux64-${pkgver}_${_language}.tar.xz \
      "$pkgdir/opt/$pkgname/tor-browser-linux64-${pkgver}_${_language}.tar.xz"
  fi
}

# vim:set ts=2 sw=2 et:
