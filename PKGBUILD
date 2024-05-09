# Maintainer: Sterophonick
pkgname=supercard-sd
_pkgname='supercard-sd'
pkgver=v271
pkgrel=1
pkgdesc='SuperCard SD Patching Software'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
makedepends=('innoextract') # SuperCard used InnoSetup for this installer.
source=(https://web.archive.org/web/20140720061837/http://eng.supercard.sc/download/setupsdV271en.zip
        supercard-sd
        supercard-sd.desktop
        supercard-sd.png)
md5sums=('b3fe776988b538cf477ed5cadeeddc83'
         'SKIP'
         'SKIP'
         'SKIP')
options=(!debug !strip)

prepare() {
  cd $srcdir
  innoextract setupsdV271en.exe

}

package() {
  install -Dm755 supercard-sd $pkgdir/usr/bin/supercard-sd
  install -Dm644 supercard-sd.desktop $pkgdir/usr/share/applications/supercard-sd.desktop
  install -Dm644 supercard-sd.png $pkgdir/usr/share/pixmaps/supercard-sd.png

  mkdir -p $pkgdir/usr/share/supercard-sd

  cp -r $srcdir/app/* $pkgdir/usr/share/supercard-sd
  chmod -R 777 $pkgdir/usr/share/supercard-sd
}
