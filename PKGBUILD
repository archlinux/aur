# Contributor: chris_L <chrislcenter dash mamoru at yahoo.com dot mx>

pkgname=th07
pkgver=0.11
pkgrel=3
pkgdesc="Perfect cherry blossom trial version. Seventh game of the Touhou Project series. (via wine)"
arch=(i686 x86_64)
url="http://www16.big.or.jp/~zun/html/th07.html"
license=('custom')
depends=()
[ "$CARCH" = i686   ] && depends=(wine)
[ "$CARCH" = x86_64 ] && depends=(bin32-wine)
makedepends=(lha)
optdepends=('timidity++: to get MIDI background music')
source=(
  th07.sh
  th07.desktop
  license
  th07.xpm
  http://www16.big.or.jp/~zun/data/soft/youmu_tr011.lzh
)
noextract=("youmu_tr011.lzh")
#http://homepage.ntlworld.com/steven.mitchell83/th07_english_patch_1%5b1%5d.0.exe)
install=${pkgname}.install

md5sums=('b5fb7535a1ad78b53fd0bc6cdd5bd018'
  '35d37eb00a1f7e6fc265f47e639ddfbc'
  '5de1cb787942308b7620f93a176367d9'
  'ecdec576d60c662738e2495947543b95'
  '05360e859c1a3ca173b9d57d96a45b9b')



options=(!strip)

build() {
  cd $srcdir/
  lha e youmu_tr011.lzh
  cd youmu
  find -type d|grep -va '\(html\|^.$\)'|xargs -I dir mv "dir" th07man
  ls *.txt|grep -va '^[rc]'|xargs -I file mv file info.txt
}
package() {
  cd $srcdir
  install -d -m755 $pkgdir/usr/share/
  cp -R youmu $pkgdir/usr/share/$pkgname
  find $pkgdir/usr/share/th07 -type d -exec chmod 755 "{}" \;
  find $pkgdir/usr/share/th07 -type f -exec chmod 644 "{}" \;
  install -d -m755 $pkgdir/usr/bin
  install -m755 th07.sh $pkgdir/usr/bin/$pkgname
  install -d -m755 $pkgdir/usr/share/applications
  install -d -m755 $pkgdir/usr/share/pixmaps
  install -d -m755 $pkgdir/usr/share/licenses/$pkgname
  install -m755 th07.desktop $pkgdir/usr/share/applications
  install -m755 th07.xpm $pkgdir/usr/share/pixmaps/th07.xpm
  install -m755 license $pkgdir/usr/share/licenses/$pkgname/license
}

