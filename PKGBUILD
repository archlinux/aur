# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=delta-media-player
pkgver=1.16
pkgrel=1
pkgdesc='provides new generation Online TV service'
arch=('i686' 'x86_64')
url='http://www.deltamediaplayer.com/en/'
license=('GPL3')
depends=(vlc gcc-libs qt5-tools)
makedepends=(chrpath)
provides=(dmplayer)
install='delta-media-player.install'
source=("https://www.deltamediaplayer.com/playercode/download/DeltaMediaPlayer-1.16.deb")
sha256sums=('4b1af2a8f89e2c9a7ab515b7959cd0c8a0f363e513c0690e79ef65acb6fb5d87')

package(){
  cd "$srcdir"
  bsdtar -xf data.tar.xz
   install -dm755 "$pkgdir"/usr
   mv usr/local/* "$pkgdir"/usr
  chrpath -d "$pkgdir"/usr/bin/dmplayer
  sed 's#/local##' -i "$pkgdir"/usr/share/applications/DeltaMediaPlayer.desktop
  rm -f "$pkgdir"/usr/lib/libevent*
  cd "$pkgdir"/usr/lib
  ln -s libevent_pthreads.so libevent_pthreads-2.1.so.6
  ln -s libevent.so libevent-2.1.so.6
  ln -s libevent_openssl.so libevent_openssl-2.1.so.6
}

