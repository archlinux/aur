# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>
# Contributors: Det, goetzc, Ner0, Lari Tikkanen, oke3, Flamelab, WAntilles

pkgname=smplayer-svn
pkgver=15.9.0.r7152
pkgrel=1
pkgdesc="Advanced front-end for MPlayer/MPV"
arch=('i686' 'x86_64')
url="http://smplayer.sourceforge.net/"
license=('GPL')
depends=('qt5-script' 'libxkbcommon-x11' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'subversion')
optdepends=('smplayer-themes-svn: icon themes collection'
            'smplayer-skins-svn: skin themes collection'
            'smtube-svn: browse and play YouTube videos'
            'youtube-dl': play streaming videos
            'mplayer: backend for video playback'
            'mpv: alternative modern backend, based on MPlayer/MPlayer2')
provides=('smplayer')
conflicts=('smplayer')
install="$pkgname.install"
source=("$pkgname::svn+https://subversion.assembla.com/svn/smplayer/smplayer/trunk/")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo $(grep -m1 'version' smplayer.spec | cut -d " " -f3).r$(svnversion)
}

build() {
  cd $pkgname
  make clean
  make PREFIX=/usr DOC_PATH='\"/usr/share/doc/smplayer\"'
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr DOC_PATH=/usr/share/doc/smplayer install
}
