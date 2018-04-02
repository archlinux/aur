#Maintainer: Solomon Choina <shlomochoina at gmail dot com>
pkgname=kawaii-player-git
_pkgname=kawaii-player
pkgver=v3.3.1.1.r62.gee16cc0
pkgrel=1
pkgdesc="An Audio/Video Manager and Front End for mpv/mplayer along with functionalities of portable media server"
arch=(any)
conflicts=('kawaii-player')
license=('GPL3')
depends=('python' 'qt5-webengine' 'python-pyqt5' 'python-pycurl' 'curl' 'libnotify' 'python-dbus' 'libtorrent-rasterbar' 'python-pytaglib' 'python-mutagen' 'python-beautifulsoup4' 'python-pillow' 'python-lxml' 'mpv' 'mplayer' 'ffmpegthumbnailer' 'sqlite3' 'youtube-dl' 'wget')
#optdepends=('livestreamer' 'youtube-dl' 'wget')
makedepends=('git')

source=("git+https://github.com/kanishka-linux/kawaii-player.git")
#source=("git+https://github.com/kanishka-linux/kawaii-player.git#branch=devel")
md5sums=('SKIP')
_gitname=kawaii_player

pkgver() {
  cd "$srcdir/kawaii-player"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/kawaii-player
  python setup.py install --root="$pkgdir" --optimize=1 --prefix=/usr 
  install -D "${pkgdir}/usr/lib/python3.6/site-packages/kawaii_player/resources/kawaii-player.desktop" "${pkgdir}/usr/share/applications/kawaii-player.desktop"
}
