# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>
# Maintainer (English version): Max Roder <maxroder@web.de>

pkgname=tor-browser-es
_language=es-ES
pkgver=4.5.3
pkgrel=1
pkgdesc="Navegación anónima utilizando Firefox y Tor"
arch=('i686' 'x86_64')
url="https://www.torproject.org/projects/torbrowser.html"
license=('GPL')
depends=('dbus-glib' 'gtk2')
optdepends=('kdebase-kdialog: KDE dialog boxes'
            'libnotify: Gnome dialog boxes'
            'zenity: simple dialog boxes')
install=$pkgname.install
validpgpkeys=('EF6E286DDA85EA2A4BA7DE684E2C6E8793298290')

source_x86_64=("https://www.torproject.org/dist/torbrowser/$pkgver/tor-browser-linux64-${pkgver}_${_language}.tar.xz"
               "https://www.torproject.org/dist/torbrowser/$pkgver/tor-browser-linux64-${pkgver}_${_language}.tar.xz.asc")
source_i686=("https://www.torproject.org/dist/torbrowser/$pkgver/tor-browser-linux32-${pkgver}_${_language}.tar.xz"
             "https://www.torproject.org/dist/torbrowser/$pkgver/tor-browser-linux32-${pkgver}_${_language}.tar.xz.asc")
source+=("$pkgname.desktop"
         "$pkgname.png"
         "$pkgname.sh")

sha256sums_x86_64=('df7961b4384012eedd96c31d62633c9b95ae727f12f5e650ffdf7f6d5ca30617'
                 'SKIP')
sha256sums_i686=('196cfd81e726d0e1f7ecf0fe0183eac6b7e2cf8e8c5bc89b9105ce4d82e0922a'
               'SKIP')
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
