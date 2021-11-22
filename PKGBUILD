# Maintainer: Serge Roussak <beaux_monde@tut.by>
pkgname=smplayer-qt4
pkgver=21.10.0
pkgrel=1
pkgdesc='Complete front-end for MPlayer/MPV (Qt4)'
arch=('i686' 'x86_64')
url='https://www.smplayer.info/'
license=('GPL')
depends=('qt4' 'mplayer')
optdepends=('smplayer-themes: icon themes collection'
            'smplayer-skins: skin themes collection'
            'smtube: browse and play youtube videos'
            'mpv: video player based on MPlayer/mplayer2')
makedepends=('make')
provides=('smplayer')
conflicts=('smplayer')
install=smplayer.install
source=("https://downloads.sourceforge.net/smplayer/smplayer-$pkgver.tar.bz2")
sha256sums=('2c0bf10add4bea2582104281553cda9792b74d41273a98bceaa147c70065db8a')

build() {
  cd "smplayer-$pkgver"
  make PREFIX=/usr                                  \
       DOC_PATH="\\\"/usr/share/doc/smplayer\\\""   \
       QMAKE=qmake-qt4                              \
       LRELEASE=lrelease-qt4                        \
       QMAKE_OPTS=DEFINES+=NO_DEBUG_ON_CONSOLE      \
       all
}

package() {
  cd "smplayer-$pkgver"
  make PREFIX=/usr                                  \
       DOC_PATH=/usr/share/doc/smplayer             \
       DESTDIR="$pkgdir"                            \
       install
}
