# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
# http://vgperson.com/games/witchhouse.htm
_pkgname=majonoie
pkgname=${_pkgname}-en
pkgver=1.07
pkgrel=1
pkgdesc="The game \"The Witch's House\" also known as \"Majo No Ie\". English ver."
url='http://majonoie.karou.jp'
arch=('any')
license=('custom')
depends=('mkxp-git' 'rpgvx-rtp')
makedepends=('p7zip')
source=("http://vgperson.com/games/TheWitchsHouse107.zip"
        "LICENSE"
        "mkxp.conf"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
md5sums=('c11fc643fc105ed925cbeaa2eff1c23d'
         'e1ee4d59be2f6200828470a1ebc7bcf7'
         '461180ee21f3d882bfed9c4c3c3b24c8'
         '58c8cf9cdf2a1cefd2fd0b198f22e95f'
         'dee931ca691fcdfcc937eedb30fe9d00'
         'd81ac9dea4008515d8ae636b725fa32f')
noextract=TheWitchsHouse107.zip

package() {
  
  install -dm755 "$pkgdir/opt/$pkgname"
  install -dm755 "$pkgdir/usr/"{bin,share/applications,share/pixmaps}
  cd "$pkgdir/opt/$pkgname"
  7z x "$srcdir/TheWitchsHouse107.zip"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/opt/$pkgname/LICENSE"
  install -Dm644 "$srcdir/mkxp.conf" "$pkgdir/opt/$pkgname/mkxp.conf"
  rm "$pkgdir/opt/$pkgname/PublicData.rvdata"
  
  cd "$pkgdir/opt/$pkgname"
  find . -type d -exec chmod 755 {} \;
  find . -not -type d -exec chmod 644 {} \;
  find . -type d | xargs chmod 755
  find . -not -type d | xargs chmod 644
  
  install -Dm755 "${srcdir}/${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "${srcdir}/${pkgname}.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

}
