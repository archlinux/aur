# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
_pkgname=majonoie
pkgname=${_pkgname}-jp
pkgver=1.07
pkgrel=1
pkgdesc="The game \"The Witch's House\" also known as \"Majo No Ie\". Japanese ver."
url='http://majonoie.karou.jp'
arch=('any')
license=('custom')
depends=('mkxp-git' 'rpgvx-rtp')
makedepends=('p7zip' 'convmv') # 'perl-archive-rgssad' 'imagemagick'
source=("http://dl3.fgamearchives.com/archives/win/2351/majo_$pkgver.exe"
        "LICENSE"
        "mkxp.conf"
        "Game.ini"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
md5sums=('bc60de550adb1fc7c50c4b095057b950'
         'e1ee4d59be2f6200828470a1ebc7bcf7'
         '939283359891ea78140ac960c19cbc3e'
         '88982d07f8afa4f77b21666bb0adc570'
         '98655ade1e74c70378063f1ce9f49337'
         'dee931ca691fcdfcc937eedb30fe9d00'
         'd81ac9dea4008515d8ae636b725fa32f')
noextract=majo_$pkgver.exe

package() {
  
  install -dm755 "$pkgdir/opt/$pkgname"
  install -dm755 "$pkgdir/usr/"{bin,share/applications,share/pixmaps}
  cd "$pkgdir/opt/$pkgname"
  LANG=ja_JP 7z x "$srcdir/majo_$pkgver.exe"
  convmv -r -f SHIFT-JIS -t utf-8 --notest .
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/opt/$pkgname/LICENSE"
  install -Dm644 "$srcdir/mkxp.conf" "$pkgdir/opt/$pkgname/mkxp.conf"
  install -Dm644 "$srcdir/Game.ini" "$pkgdir/opt/$pkgname/Game.ini"
  
  cd "$pkgdir/opt/$pkgname"
  find . -type d -exec chmod 755 {} \;
  find . -not -type d -exec chmod 644 {} \;
  find . -type d | xargs chmod 755
  find . -not -type d | xargs chmod 644
  
  #cd "$srcdir"
  #rgssad "$pkgdir/opt/$pkgname/Game.rgss2a"
  #convert -crop 96x96+0+0 "$srcdir/Graphics/Faces/viviface2.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm755 "${srcdir}/${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "${srcdir}/${pkgname}.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

}
