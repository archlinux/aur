pkgname=smtube-svn
pkgver=15.5.17.r6953
pkgrel=1
pkgdesc="Search, download and play videos from YouTube. SVN build."
arch=('i686' 'x86_64')
url="http://smtube.sourceforge.net"
license=('GPL')
depends=('qt5-script' 'qt5-webkit' 'hicolor-icon-theme' 'libxkbcommon-x11')
makedepends=('subversion' 'qt5-tools')
optdepends=('smplayer: play videos with SMPlayer'
            'mpv: play videos with mpv'
            'gnome-mplayer: play videos with GNOME MPlayer'
            'kdemultimedia-dragonplayer: play videos with Dragon Player'
            'totem: play videos with Totem'
            'vlc: play videos with VLC')
provides=('smtube')
conflicts=('smtube')
install="$pkgname.install"
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
