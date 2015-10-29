# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
pkgname=rpgxp-rtp
pkgver=103
pkgrel=1
pkgdesc="RPGMaker XP Runtime Package"
url='http://www.rpgmakerweb.com/download/additional/run-time-packages'
arch=('any')
license=('custom: commercial')
makedepends=('libarchive' 'innoextract' 'convmv')
source=("http://tkool.jp/assets/files/xp_rtp$pkgver.zip" "LICENSE")
md5sums=('3a4a0f3615f536e29b4b1cf33ee58742' 'fb08af026ac58b13ee582a447575cf42')
noextract=xp_rtp$pkgver.zip

package() {
  cd "$srcdir"
  bsdtar xf xp_rtp$pkgver.zip
  cd RPGXP_RTP$pkgver
  innoextract Setup.exe
  convmv -r -f SHIFT-JIS -t utf-8 --notest .
  mkdir -p "$pkgdir/opt/"
  cp -r app "$pkgdir/opt/$pkgname"
  cp sys/*.dll "$pkgdir/opt/$pkgname"
  cp "利用規約.txt" "$pkgdir/opt/$pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/opt/$pkgname/LICENSE"
}
