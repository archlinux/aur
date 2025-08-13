# Contributor: maz-1 <ohmygod19993 at gmail dot com>

pkgname=yumenikki-en
pkgver=0.10
pkgrel=3
pkgdesc="Surrealistic adventure game about exploring the dreams"
url='http://www3.nns.ne.jp/pri/tk-mto/'
arch=('any')
license=('custom')
depends=(easyrpg-player)
makedepends=(desktop-file-utils)
source=("yumenikki-en.7z::https://dl.dropbox.com/s/a5dqfazyfrvjr8f/yumenikki-en.7z?dl=1"
https://cdn2.steamgriddb.com/icon/06409663226af2f3114485aa4e0a23b4/8/16x16.png
 ${pkgname}.sh)
sha256sums=('a14aa1e3a69d04d1624dc127cf400793372ff53368d49f277fad36a4c8437460'
            '9241bab9fbc7383fa0daac31ce4ddde40643742c5d013c90d12724eeb323d587'
            '4c24ba558a08c55ce2e0d40d4121f5729088a8fd5e3a8006cc4f71e793fca74c')
         
package() {
  rm -f ${pkgname}/{*.exe,*/Thumbs.db} #todo: replace bundled RTP with rpg2003-rtp
  install -d "$pkgdir/opt"
  mv $pkgname "$pkgdir/opt/$pkgname"
  install -Dm644 16x16.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
  # Entry
  install -Dm644 /usr/share/applications/easyrpg-player.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  desktop-file-edit "$pkgdir/usr/share/applications/$pkgname.desktop" \
    --set-name=yumenikki --set-key=Exec --set-value=${pkgname} --set-icon=${pkgname} --set-comment='Explore the dreams'  
}
