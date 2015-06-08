# Maintainer: iruel <moot at 404chan dot tk>
# Contributor (to th07 pkgbuild): chris_L <chrislcenter dash mamoru at yahoo.com dot mx>

pkgname=th08
pkgver=0.03
pkgrel=3
pkgdesc="The eighth game of the Touhou Project series, Imperishable Night trial version (via wine). Easy upgrade to full version."
arch=(i686 x86_64)
url="http://www16.big.or.jp/~zun/html/th08top.html"
license=('custom')
depends=()
[ "$CARCH" = i686   ] && depends=(wine)
[ "$CARCH" = x86_64 ] && depends=(bin32-wine)
makedepends=()
[ "$CARCH" = i686   ] && makedepends=(lha)
[ "$CARCH" = x86_64 ] && makedepends=(bin32-lha)
optdepends=('timidity++: to get MIDI background music')
source=(th08.sh th08.desktop license http://dl.dropbox.com/u/22186524/files/th08.png http://mirror0.fuzzy2.com/zun/eiya_tr003.lzh)
install=${pkgname}.install
md5sums=('8eb909dd8b016ca81ac498c77876b693'
'8849405deb2bc3954c720468be36e8c4'
'5de1cb787942308b7620f93a176367d9'
'c6cea48ee3d175b01d512f06481f8063'
'c42647202a695bd1fdd2d88ce6615d53')

noextract=()
options=(!strip)

build() {
	  cd $srcdir/
	  lha e eiya_tr003.lzh
	  cd eiya
	  find -type d|grep -v '\(html\|^.$\)'|xargs -I dir mv "dir" th08man
	  ls *.txt|grep -v '^[rc]'|xargs -I file mv file info.txt
	  cd ..
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
	  install -m755 th08.png $pkgdir/usr/share/pixmaps/th08.png
	  install -m755 license $pkgdir/usr/share/licenses/$pkgname/license
}

