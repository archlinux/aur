# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Soeren Koerner <nonick at posteo dot de>
# Contributor: Benedikt 'linopolus' Mueller <benemue at googlemail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mtplayer
_realname=MTPlayer
_majorver=13
_minorver=2023.03.07
pkgver=${_majorver}__${_minorver}
pkgrel=1
pkgdesc="Offers access to the Mediathek of different german tv stations (ARD, ZDF, Arte, etc.)"
arch=('any')
url="https://www.p2tools.de/mtplayer/"
license=('GPL3')
depends=('java-runtime>=11' 'ffmpeg')
optdepends=('rtmpdump: stream flash'
	    'flvstreamer: stream flash alternatively'
            'vlc: play files directly from mediathek')
source=("https://github.com/xaverW/${_realname}/releases/download/version-${_majorver}/${_realname}-${pkgver}.zip"
        $pkgname.desktop $pkgname.sh)
sha256sums=('a0ebf17e6321b197afd87677ab6f44488177032ada9951aa51de88952aa4230c'
            '00ac87b32ec859299ac8ce456a3d2773f5e849779f726711561c32ed5a075dc8'
            'e41444cc5fb59938e1532eeb7d6e9163812226dc8f5790e529858bcf4b38cd30')

package() {
  install -d "$pkgdir"/opt
  cp -r $_realname "$pkgdir"/opt
  install -Dm755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "$pkgdir"/opt/$_realname/$_realname.png "$pkgdir"/usr/share/pixmaps/MTPlayer.png
  install -Dm644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  # remove unneeded stuff
  find "$pkgdir" -name "*.exe" -exec rm {} \;
  install -Dm644 "$pkgdir"/opt/$_realname/$_realname.png "$pkgdir"/usr/share/pixmaps/MTPlayer.png
  rm "$pkgdir"/opt/$_realname/$_realname.png
}
