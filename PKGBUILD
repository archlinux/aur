# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
# http://www.yumenikki.info/
_pkgname=yumenikki
pkgname=${_pkgname}-zh-cn
pkgver=0.10
pkgrel=1
pkgdesc="Surrealistic adventure game about exploring the dreams of a hikikomori character named Madotsuki.Also known as \"Dream Diary\". Simplified chinese Ver."
url='http://www3.nns.ne.jp/pri/tk-mto/'
arch=('any')
license=('custom')
depends=('easyrpg-player') # 'rpg2003-rtp'
makedepends=('unarchiver' 'convmv')
source=("http://yumenikki.info/${_pkgname}${pkgver}chs.rar"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
md5sums=('b9a475e67f51cd1280d727e877bbd587'
         'ff532e2f1a3b3a137c60697740d0896c'
         'b8f0addba27f5c18f806c35b933ec8d9'
         '8b7d40a967df6d5636aa2fd33d4809c8')
noextract=${_pkgname}${pkgver}chs.rar

prepare() {
  cd "${srcdir}"
  unar "$srcdir/${_pkgname}${pkgver}chs.rar"
    
}

package() {
  
  install -dm755 "$pkgdir/opt/"
  install -dm755 "$pkgdir/usr/"{bin,share/applications,share/pixmaps}
  #cd "$pkgdir/opt/$pkgname"
  
  cp -r "$srcdir/梦日记/Yumenikki0.10/" "$pkgdir/opt/$pkgname"
  cp "$srcdir/梦日记/请先阅读。0.10.txt" "$pkgdir/opt/$pkgname"
  cp "$srcdir/梦日记/中文版补充说明.txt" "$pkgdir/opt/$pkgname"
  echo "Read \"/opt/${pkgname}/请先阅读。0.10.txt\"." > "$pkgdir/opt/$pkgname/LICENSE"
  
  cd "$pkgdir/opt/$pkgname"
  
  install -Dm755 "${srcdir}/${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "${srcdir}/${pkgname}.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

}
