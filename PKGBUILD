# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Swen Simon <swsimon at gmail dot com>
#
pkgname=epsxe
pkgver=1.9.25
pkgrel=3
pkgdesc="Enhanced PSX emulator"
url="http://epsxe.com"
arch=('i686' 'x86_64')
[ "$CARCH" = "i686" ] && depends+=(gtk2 sdl_ttf libtinfo)
[ "$CARCH" = "x86_64" ] && depends+=(lib32-gtk2 lib32-ncurses lib32-libxt lib32-sdl_ttf lib32-alsa-lib lib32-libtinfo)
license=('unknown')
install=${pkgname}.install
options=(!strip)
source=(${pkgname}.desktop ${pkgname}.png ${pkgname}.sh
       "http://www.epsxe.com/files/epsxe${pkgver//./}lin.zip")
md5sums=('087234e20ae9147f83df24b69fc93bca'
         'eb0c46b8ae1355c589792f6be1835e47'
         '1d6d07e9e1c97ed2a7ce46a9b7419654'
         'dc54e1e3406b0010e0552cffabb16c0f')

package () {
  cd "$srcdir"
  install -m775 -g games -d "$pkgdir/opt/$pkgname/"{plugins,bios,memcards,cfg,cdimages,cheats,patches,sstates,snap}
  install -d "$pkgdir"/usr/share/doc/"$pkgname"

  find docs -name 'e???e_*.txt' -execdir install -m 644 -t $pkgdir/usr/share/doc/$pkgname \{\} +
  #  find . -name '*.cht' -execdir "install -Dm 644 -t \$pkgdir/opt/$pkgname/$pkgver/cheats\"" \{\} +

  install -Dm 755 ${pkgname} "$pkgdir/opt/$pkgname/$pkgname"
  install -Dm 644 keycodes.lst "$pkgdir/opt/$pkgname/keycodes.lst"

  install -Dm 755 ${pkgname}.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 "$srcdir/epsxe.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "$srcdir/epsxe.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"

  ln -sf "$HOME/.${pkgname}rc" -T "$pkgdir/opt/$pkgname/.${pkgname}rc"
}
