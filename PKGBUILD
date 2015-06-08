# Maintainer: Jonne Hass <me@mrzyx.de>
pkgname=hades
pkgver=0.98f
pkgrel=3
pkgdesc="Hamburg Design System, a framework for interactive simulation."
arch=('any')
url="http://tams-www.informatik.uni-hamburg.de/applets/hades/"
license=('custom')
depends=('java-runtime')
makedepends=('unzip' 'imagemagick')
source=("http://tams-www.informatik.uni-hamburg.de/applets/hades/archive/$pkgname.jar"
        'hades'
        'hades.desktop'
        'LICENSE')
noextract=("$pkgname.jar")
md5sums=('4f104e2043409d44971eb653a27f9fee'
         '1b047459e66bbf7034529ea692494651'
         '8c3e9b529717672fa83c563e2150eabe'
         '03060d8220e2b702d585cb82de751e1d')

build() {
  cd "$srcdir"
  unzip -u "$pkgname.jar" "hades/gui/images/hades.gif" -d ./pixmaps
  convert "pixmaps/hades/gui/images/hades.gif" "pixmaps/$pkgname.png"
}

package() {
  cd "$srcdir"
  
  install -Dm644 "$pkgname.jar" \
                 "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755 "hades" \
                 "$pkgdir/usr/bin/hades"
  install -Dm644 "pixmaps/$pkgname.png" \
                 "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "hades.desktop" \
                 "$pkgdir/usr/share/applications/hades.desktop"
  install -Dm644 "LICENSE" \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
