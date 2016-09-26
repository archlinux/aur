_pkgname=smplayer
pkgname=$_pkgname-qt4
pkgver=16.9.0
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
sha512sums=('ec424b583372df599c4785ae63d33dccbf963e6dd560faaf2159ca2aa47891f8a7797c3f0091ede8802d039ed97c5fdf6b944085abc7d50580f10fc8218e1902')

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
