# Maintainer: Steffen Weber <-boenki-gmx-de->
# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Soeren Koerner <nonick at posteo dot de>
# Contributor: Benedikt 'linopolus' Mueller <benemue at googlemail dot com>

pkgname=mtplayer
_realname=MTPlayer
pkgver=8
pkgrel=1
pkgdesc="Offers access to the Mediathek of different german tv stations (ARD, ZDF, Arte, etc.)"
arch=('any')
url="https://www.p2tools.de/mtplayer/"
license=('GPL3')
depends=('java-runtime>=11' 'ffmpeg')
optdepends=('rtmpdump: stream flash'
	    'flvstreamer: stream flash alternatively'
            'vlc: play files directly from mediathek')
source=("https://www.p2tools.de/extra/download/${_realname}-$pkgver.zip"
        $pkgname.desktop $pkgname.sh)
sha256sums=('2e8582f80ec0fdfe427c050d2bfcbe780de3d5f82169a76d1be4f1c4614348f2'
            '00ac87b32ec859299ac8ce456a3d2773f5e849779f726711561c32ed5a075dc8'
            'e41444cc5fb59938e1532eeb7d6e9163812226dc8f5790e529858bcf4b38cd30')

package() {
  install -d "$pkgdir"/opt
  cp -r $_realname "$pkgdir"/opt
  install -Dm755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "$pkgdir"/opt/$_realname/$_realname.png "$pkgdir"/usr/share/pixmaps/MTPlayer.png
  install -Dm644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/aplications/$pkgname.desktop
  # remove unneeded stuff
  find "$pkgdir" -name "*.exe" -exec rm {} \;
  rm "$pkgdir"/opt/$_realname/bin/flv.bat
  install -Dm644 "$pkgdir"/opt/$_realname/$_realname.png "$pkgdir"/usr/share/pixmaps/MTPlayer.png
  rm "$pkgdir"/opt/$_realname/$_realname.png
}
