pkgname=smtube-svn
pkgver=16.3.0.r7902
pkgrel=1
pkgdesc="Search, download and play videos from YouTube. SVN build."
arch=('i686' 'x86_64')
url="http://www.smtube.org"
license=('GPL')
depends=('qt5-script' 'qt5-webkit' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('subversion' 'qt5-tools')
optdepends=('smplayer: play videos with SMPlayer'
            'mpv: play videos with mpv'
            'gnome-mplayer: play videos with GNOME MPlayer'
            'kdemultimedia-dragonplayer: play videos with Dragon Player'
            'totem: play videos with Totem'
            'vlc: play videos with VLC'
            'youtube-dl: download videos')
provides=('smtube')
conflicts=('smtube')
source=('smtube::svn+https://subversion.assembla.com/svn/smplayer/smtube/trunk/')
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST"/smtube
  echo $(grep -m1 "VERSION \"" src/version.cpp | cut -d " " -f3 | sed -e 's/^"\(.*\)"$/\1/').r$(svnversion)
}

build() {
  cd "$srcdir/smtube"
   make clean
  ./get_svn_revision.sh
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/smtube"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
}
