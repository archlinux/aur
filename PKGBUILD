# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>
# Contributors: Det, goetzc, Ner0, Lari Tikkanen, oke3, Flamelab, WAntilles

pkgname=smplayer-svn
pkgver=14.9.0.r7059
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
            'mplayer: backend for video playback'
            'mpv: alternative modern backend, based on MPlayer/MPlayer2')
provides=('smplayer')
conflicts=('smplayer')
install="$pkgname.install"
source=("$pkgname::svn+https://subversion.assembla.com/svn/smplayer/smplayer/trunk/"
        "qtlocalpeer.patch")
sha256sums=('SKIP'
            'd35fe43266e4fe0b18de2f2a06d35c958faa881491b7649980d277038655c34b')

pkgver() {
  cd $pkgname
  echo $(grep -m1 'version' smplayer.spec | cut -d " " -f3).r$(svnversion)
}

prepare() {
  cd $pkgname
  patch -p0 -i ../qtlocalpeer.patch
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
