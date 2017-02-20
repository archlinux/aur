_pkgname=smplayer
pkgname=$_pkgname-qt4
pkgver=17.2.0
pkgrel=1
pkgdesc="Complete front-end for MPlayer/MPV (Qt4)"
arch=('i686' 'x86_64')
url="http://smplayer.sourceforge.net/"
license=('GPL')
depends=('qt4' 'mplayer')
optdepends=('smplayer-themes: icon themes collection'
            'smplayer-skins: skin themes collection'
            'smtube: browse and play youtube videos'
            'mpv: video player based on MPlayer/mplayer2')
provides=('smplayer')
conflicts=('smplayer')
install=smplayer.install
source=(https://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.bz2)
sha512sums=('dbe22c5bf7da4d4635b0d47837d3e03c12cea40ec4fbca58009567995547c4a065d35feb149d7ff3f799604f3107527ce4e1f564d860161ada84b499cb42d9c8')

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
