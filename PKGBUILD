# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Soeren Koerner <nonick at posteo dot de>
# Contributor: Benedikt 'linopolus' Mueller <benemue at googlemail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mtplayer
_realname=MTPlayer
_majorver=14
_minorver=2023.05.22
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
sha256sums=('d685c8e545a72d906158b1305ca6a79bbea26c33f33cfcaa4dbfc8fcdf8bdba8'
            '5194cdac06d08c84d3de151aaf77990a90ff14483329efcb0f6f898f3007ad24'
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
