# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Soeren Koerner <nonick at posteo dot de>
# Contributor: Benedikt 'linopolus' Mueller <benemue at googlemail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mtplayer-daily
_realname=MTPlayer
_majorver=14
_middlever=46
_minorver=2023.08.06
pkgver=${_majorver}__${_minorver}
pkgrel=1
pkgdesc="Offers access to the Mediathek of different german tv stations (ARD, ZDF, Arte, etc.)"
arch=('any')
url="https://www.p2tools.de/mtplayer/"
license=('GPL3')
conflicts=('mtplayer')
provides=('mtplayer')
depends=('java-runtime>=11' 'ffmpeg')
optdepends=('rtmpdump: stream flash'
	    'flvstreamer: stream flash alternatively'
            'vlc: play files directly from mediathek')
source=("https://www.p2tools.de/download/${pkgname%-daily}/daily/${_realname}-${_majorver}-${_middlever}__${_minorver}.zip"
        ${pkgname%-daily}.desktop ${pkgname%-daily}.sh)
sha256sums=('8313c8aa6558bacf23d6b14165bce50fe174401ba19a70e501590fb7e3b9fd5c'
            '5194cdac06d08c84d3de151aaf77990a90ff14483329efcb0f6f898f3007ad24'
            'e41444cc5fb59938e1532eeb7d6e9163812226dc8f5790e529858bcf4b38cd30')

package() {
  install -d "$pkgdir"/opt
  cp -r $_realname "$pkgdir"/opt
  install -Dm755 "$srcdir"/${pkgname%-daily}.sh "$pkgdir"/usr/bin/${pkgname%-daily}.sh
  install -Dm644 "$srcdir"/${pkgname%-daily}.desktop \
	  "$pkgdir"/usr/share/applications/${pkgname%-daily}.desktop
  # remove unneeded stuff
  find "$pkgdir" -name "*.exe" -exec rm {} \;
  install -Dm644 "$pkgdir"/opt/$_realname/$_realname.png "$pkgdir"/usr/share/pixmaps/MTPlayer.png
  rm "$pkgdir"/opt/$_realname/$_realname.png
  rmdir "$pkgdir"/opt/$_realname/bin
}

