# Maintainer: chris_L <chrislcenter dash mamoru at yahoo.com dot mx>
# Contributor: iruel <moot at 404chan dot tk>

pkgname=th08
pkgver=0.03
pkgrel=5
pkgdesc="The eighth game of the Touhou Project series, Imperishable Night trial version (via wine). Easy upgrade to full version."
arch=(i686 x86_64)
url="https://www16.big.or.jp/~zun/html/th08top.html"
license=('custom')
depends=('wine')
makedepends=('lha')
optdepends=('timidity++: to get MIDI background music')
source=(th08.sh th08.desktop license th08.xpm eiya_tr003.lzh::'https://files.catbox.moe/lpdkcc.lzh')
install=${pkgname}.install
md5sums=('f68cc931fdce0d4fa65dfe0614c08db2'
         '6ebb33c8949a426794bd6203f52a8cc5'
         '5de1cb787942308b7620f93a176367d9'
         'fcd7e155a01b98b06affe5cf6d7f2ca9'
         'c42647202a695bd1fdd2d88ce6615d53')

noextract=(eiya_tr003.lzh)
options=(!strip)

build() {
  cd $srcdir/
  lha xf eiya_tr003.lzh
  cd eiya
  find -type d|LANG=C grep -v '\(html\|^.$\)'|xargs -I DIR mv DIR th08man
	ls *.txt|LANG=C grep -v '^[rc]'|xargs -I FILE mv FILE info.txt
}
package() {
  cd $srcdir/
  install -d -m755 $pkgdir/usr/share/
  cp -R eiya $pkgdir/usr/share/$pkgname
  mv $pkgdir/usr/share/$pkgname/th08tr.exe $pkgdir/usr/share/$pkgname/th08.exe
  find $pkgdir/usr/share/th08 -type d -exec chmod 755 "{}" \;
  find $pkgdir/usr/share/th08 -type f -exec chmod 644 "{}" \;
  install -d -m755 $pkgdir/usr/bin
  install -m755 th08.sh $pkgdir/usr/bin/$pkgname
  install -d -m755 $pkgdir/usr/share/applications
  install -d -m755 $pkgdir/usr/share/pixmaps
  install -d -m755 $pkgdir/usr/share/licenses/$pkgname
  install -m755 th08.desktop $pkgdir/usr/share/applications
  install -m755 th08.xpm $pkgdir/usr/share/pixmaps/th08.xpm
  install -m755 license $pkgdir/usr/share/licenses/$pkgname/license
}

