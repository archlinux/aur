pkgname=smplayer-qt4
pkgver=14.9.0.6690
pkgrel=1
pkgdesc="Complete front-end for MPlayer"
arch=('i686' 'x86_64')
url="http://smplayer.sourceforge.net/"
license=('GPL')
depends=('qt4' 'mplayer')
optdepends=('smplayer-themes: icon themes collection'
            'smplayer-skins: skin themes collection'
            'smtube: browse and play youtube videos'
            'mpv: video player based on MPlayer/mplayer2')
provides=('smplayer=$pkgver')
conflicts=('smplayer')
install=smplayer.install
source=("http://downloads.sourceforge.net/sourceforge/smplayer/smplayer-$pkgver.tar.bz2")
sha256sums=('5ec8a1d2912828e9b19f800e338029e6757fc30e3974cf62a21b67f46632bc5a')

build() {
  cd "smplayer-$pkgver"
  make PREFIX=/usr QMAKE=qmake-qt4 LRELEASE=lrelease-qt4 \
      DOC_PATH="\\\"/usr/share/doc/smplayer\\\"" \
      QMAKE_OPTS=DEFINES+=NO_DEBUG_ON_CONSOLE
}

package() {
  cd "smplayer-$pkgver"
  make DOC_PATH=/usr/share/doc/smplayer \
      DESTDIR="$pkgdir" PREFIX="/usr" install
}
