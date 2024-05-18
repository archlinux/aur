# Maintainer: Sterophonick
pkgname=pceadvance
_pkgname='pceadvance'
pkgver=7.5
pkgrel=3
pkgdesc='PCEAdvance ROM Builder'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
source=(https://www.zophar.net/fileuploads/2/16439qqcnu/PCEAdvance75Bin.zip
        https://www.zophar.net/fileuploads/2/16440lvavd/PCEAdvance75EZ3.zip
        https://www.zophar.net/fileuploads/2/16441nhucp/PCEAdvanceSC.zip
        pceadvance
        pceadvance.desktop
        pceadvance.png)
makedepends=('p7zip')
md5sums=('40df81bc31ccead3dde5ee9ac61c83af'
         '5fb10b96a6d987e6b888d321c5ba33ab'
         '071b4e9eda896562a12a01e7bbbb89bd'
         'SKIP'
         'SKIP'
         'SKIP')
options=(!debug !strip)
noextract=('PCEAdvanceSC.zip' 'PCEAdvance75EZ3.zip')

package() {
  install -Dm755 pceadvance $pkgdir/usr/bin/pceadvance
  install -Dm644 pceadvance.desktop $pkgdir/usr/share/applications/pceadvance.desktop
  install -Dm644 pceadvance.png $pkgdir/usr/share/pixmaps/pceadvance.png

  mkdir -p $pkgdir/usr/share/pceadvance

  cp -r $srcdir/CDfiles $pkgdir/usr/share/pceadvance
  cp -r $srcdir/CDROM_readme.txt $pkgdir/usr/share/pceadvance
  cp -r $srcdir/gamelist.txt $pkgdir/usr/share/pceadvance
  cp -r $srcdir/history.txt $pkgdir/usr/share/pceadvance
  cp -r $srcdir/PCEAdvance_ROM_BUILDER.EXE $pkgdir/usr/share/pceadvance
  mv $srcdir/pceadvance.gba $pkgdir/usr/share/pceadvance/pceadvance_generic.gba
  cp -r $srcdir/readme.txt $pkgdir/usr/share/pceadvance
  cp -r $srcdir/splashlogo.raw $pkgdir/usr/share/pceadvance
  cp -r $srcdir/xg2005_splash-logo.raw $pkgdir/usr/share/pceadvance

  7z e PCEAdvance75EZ3.zip -o$pkgdir pceadvance.gba
  mv $pkgdir/pceadvance.gba $pkgdir/usr/share/pceadvance/pceadvance_ezflash.gba

  7z e PCEAdvanceSC.zip -o$pkgdir pceadvance.gba
  mv $pkgdir/pceadvance.gba $pkgdir/usr/share/pceadvance/pceadvance_sc.gba

  chmod -R 777 $pkgdir/usr/share/pceadvance
}
