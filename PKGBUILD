# Contributor: maz-1 <ohmygod19993 at gmail dot com>
_pkgname=yumenikki
pkgname=${_pkgname}-jp
pkgver=0.10
pkgrel=2
pkgdesc="Surrealistic adventure game about exploring the dreams of a hikikomori character named Madotsuki (Japanese)."
url='http://www3.nns.ne.jp/pri/tk-mto/'
arch=('any')
license=('custom')
depends=('easyrpg-player') #fluidsynth,soundfont-gmgsx?
makedepends=('unarchiver' 'rpg2003-rtp')
source=("http://ftp.vector.co.jp/43/88/3084/${_pkgname}${pkgver}.lzh"
        ${pkgname}.{desktop,png,sh} )
md5sums=('f3a16c395078dcec4950200732bc5194'
         'SKIP'{,,})
options=(!strip)
prepare() {
  unar -e cp932 "${_pkgname}${pkgver}.lzh" #unsupoorted by bsdtar yet
}

package() {
  install -d "$pkgdir/opt"
  mv "ゆめにっき/ゆめにっき${pkgver}" "$pkgdir/opt/$pkgname"
  rm "$pkgdir/opt/$pkgname/"{RPG_RT{.exe,_bak.ldb},*/Thumbs.db} #gabadge
  iconv -f cp932 "$srcdir/ゆめにっき/初めに読んで下さい。${pkgver}.txt" > "$pkgdir/opt/$pkgname/ReadMe.txt"
  install -Dm644 "${pkgname}.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
