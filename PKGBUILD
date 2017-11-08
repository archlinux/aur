# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=delta-media-player
pkgver=1.17
pkgrel=1
pkgdesc='IPTV program stream player for DMPlayer'
arch=('i686' 'x86_64')
url='http://www.deltamediaplayer.com/en/'
license=('GPL3')
depends=(vlc gcc-libs qt5-tools 'libevent>=2.1.8')
makedepends=(chrpath)
provides=(dmplayer)
source=("https://www.deltamediaplayer.com/playercode/download/DeltaMediaPlayer-$pkgver.deb")
sha256sums=('b42f89d48a82df7d3dcb4dc92b76e9dabf57455ede8a9cd26e251274b76a2962')

package(){
  cd "$srcdir"
  bsdtar -xf data.tar.xz
  install -dm755 "$pkgdir"/usr
  mv usr/local/* "$pkgdir"/usr
  chrpath -d "$pkgdir"/usr/bin/dmplayer
  sed 's#/local##' -i "$pkgdir"/usr/share/applications/DeltaMediaPlayer.desktop
  rm -f "$pkgdir"/usr/lib/libevent*
}

