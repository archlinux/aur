# Maintainer: Sterophonick
pkgname=sappy2006
_pkgname='sappy2006'
pkgver=1.2
pkgrel=3
pkgdesc='MusicPlayer2000 music and sound player and editor'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
makedepends=('p7zip')
source=(https://archive.org/download/installateur-sappy/Installateur_Sappy.exe
        mod17.zip # TODO: wait for wine to fix its funniness
        sappy2006
        sappy2006.desktop
        sappy2006.png)
md5sums=('07073b912761a3fc75d15e71f4af61f9'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')
noextract=(mod17.rar)

prepare() {
  cd $srcdir
  mkdir -p installer
  7z x Installateur_Sappy.exe -aou -oinstaller

  # work around nsis quirk where registerd dll/ocx do weird things
  cd installer
  mv \$R0 fmod.dll # f51a7dd4d040a9c079cf64d36f569673
  mv \$R0_1 timermm.dll # d0351cbb8d3a946bde5f43fc6ca8086
  mv \$R0_2 vbalCbEx6.ocx # 0e1135954bb1dbd1b3bb91ce7667ade2
  mv \$R0_3 vbalExpBar6.ocx # e73792847f2bbb41e79cd31afd20926e
  mv \$R0_4 cPopMenu6.ocx # 4219192acf00a39f10f6e76439290580
  mv \$R0_5 SSubTmr6.dll # dc7a3bc0fc185cd68848dc6f7d7b026b

}

package() {
  install -Dm755 sappy2006 $pkgdir/usr/bin/sappy2006
  install -Dm644 sappy2006.desktop $pkgdir/usr/share/applications/sappy2006.desktop
  install -Dm644 sappy2006.png $pkgdir/usr/share/pixmaps/sappy2006.png

  mkdir -p $pkgdir/usr/share/sappy2006

  cp -r $srcdir/installer/* $pkgdir/usr/share/sappy2006
  chmod -R 777 $pkgdir/usr/share/sappy2006
}
