# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
pkgname=rpg2003-rtp
pkgver=100
pkgrel=1
pkgdesc="RPGMaker 2003 Runtime Package"
url='http://www.rpgmakerweb.com/download/additional/run-time-packages'
arch=('any')
license=('custom: commercial')
makedepends=('unarchiver' 'unshield-git' 'convmv')
source=("http://tkool.jp/assets/files/2003rtp.zip")
md5sums=('8b15ba45ae77cf06b59bff2ead633c4c')
noextract=2003rtp.zip

package() {
  cd "$srcdir"
  unar -encoding SHIFT-JIS 2003rtp.zip
  cd "2003RTPｾｯﾄｱｯﾌﾟ"
  unar RPG2003RTP.exe
  cd RPG2003RTP
  unshield -R x data1.cab
  convmv -r -f SHIFT-JIS -t utf-8 --notest .
  
  mkdir -p "$pkgdir/opt/"
  cp -r "${srcdir}/2003RTPｾｯﾄｱｯﾌﾟ/RPG2003RTP/RPGﾂｸｰﾙ2003_ﾗﾝﾀｲﾑﾊﾟｯｹｰｼﾞ/RTP" "$pkgdir/opt/$pkgname"
  install -Dm644 "$srcdir/2003RTPｾｯﾄｱｯﾌﾟ/使用規約.txt" "$pkgdir/opt/$pkgname/使用規約.txt"
}
