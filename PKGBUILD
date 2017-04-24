_pkgname=smplayer
pkgname=$_pkgname-qt4
pkgver=17.4.2
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
sha512sums=('bb0169dc1e2d6b56f3617986647664eda677229bce5b2aa898b64574319a84ac4d51c78f5a68ab57df5dce48c1f76d0d9e0dbdefa5baee351c0a22c2a9cb5186')

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
