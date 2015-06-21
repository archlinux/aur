pkgname=smplayer-qt4
pkgver=14.9.0.6994
pkgrel=1
pkgdesc="Complete front-end for MPlayer/MPV"
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
source=("http://downloads.sourceforge.net/sourceforge/smplayer/smplayer-$pkgver.tar.bz2")
sha256sums=('4993f4d753f2982667e088d0f06fccd36535d8e65eff5acbef82d4cde132b301')

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
