# Maintainer: mirandir <mirandir@orange.fr>

pkgname=jumpnbump-menu
pkgver=0.6
pkgrel=4
pkgdesc="A pygtk launcher for jump'n'bump."
arch=('i686' 'x86_64')
license=('GPL')
depends=('jumpnbump' 'pygtk')
makedepends=('tar' 'binutils')
optdepends=('jumpnbump-levels: more levels for jumpnbump')
url="http://jumpbump.mine.nu/"
[ "$CARCH" = "x86_64" ] && _arch=amd64
[ "$CARCH" = "i686" ] && _arch=i386
source=(http://fr.archive.ubuntu.com/ubuntu/pool/universe/j/jumpnbump/jumpnbump_1.50+dfsg1-3ubuntu1_${_arch}.deb jumpnbump.png jumpnbump.desktop menu.patch)
sha256sums=('9f04df577541ea36e510003fc540d2a61f0b6786057cf982f7f650bc23148dbf'
            '86affe4b630765a238bd704011cb4346d835a8d86dc7ed3c0980fbf14d3108b4'
            '1e18deece67700ac0e8e61a33e852a85ab4549f9d20b0595aa5bea91287c4d71'
            'c155c82fbb9e8405ae5929695562c03da745aff084335c9f6d0fdf403c10c162')
[ "$CARCH" == "x86_64" ] && sha256sums=('dd4930cb19b458c68d743f26f9a72120906d0e9cd7c4d1897b098f79d4334c18' '86affe4b630765a238bd704011cb4346d835a8d86dc7ed3c0980fbf14d3108b4' '1e18deece67700ac0e8e61a33e852a85ab4549f9d20b0595aa5bea91287c4d71' 'c155c82fbb9e8405ae5929695562c03da745aff084335c9f6d0fdf403c10c162')

package() {
  cd $srcdir
  ar xv jumpnbump_1.50+dfsg1-3ubuntu1_${_arch}.deb
  tar xzf data.tar.gz

  cd $srcdir/usr/games
  patch -p0 < ../../../menu.patch || return 1

  cd $srcdir/

  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/lib/jumpnbump
  install -d $pkgdir/usr/share/{applications,icons,jumpnbump}
  install -d $pkgdir/usr/share/locale/fr/LC_MESSAGES
  cp jumpnbump.desktop $pkgdir/usr/share/applications/
  cp jumpnbump.png $pkgdir/usr/share/icons/jumpnbump.png
  cp usr/games/jumpnbump-menu $pkgdir/usr/bin/jumpnbump-menu
  cp usr/lib/jumpnbump/* $pkgdir/usr/lib/jumpnbump/
  cp usr/share/games/jumpnbump/jumpnbump_menu.glade $pkgdir/usr/share/jumpnbump/jumpnbump_menu.glade
  cp usr/share/locale/fr/LC_MESSAGES/jumpnbump-menu.mo $pkgdir/usr/share/locale/fr/LC_MESSAGES/jumpnbump-menu.mo
}
