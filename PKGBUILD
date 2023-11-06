#Maintainer: Solomon Choina <shlomochoina at gmail dot com>
pkgname=kawaii-player-git
_pkgname=kawaii-player
pkgver=v5.0.0.1.r2.g1a12d2d
pkgrel=1
pkgdesc="An Audio/Video Manager and Front End for mpv/mplayer along with functionalities of portable media server"
arch=(any)
conflicts=('kawaii-player')
license=('GPL3')
depends=('python' 'qt5-webengine' 'python-pympv-git' 'python-pyqt5' 'python-pycurl' 'curl'
         'libnotify' 'python-dbus' 'libtorrent-rasterbar' 'python-pytaglib' 'python-mutagen'
         'python-beautifulsoup4' 'python-pillow' 'python-lxml' 'mpv' 'mplayer' 'ffmpegthumbnailer'
         'sqlite3' 'youtube-dl' 'wget' 'python-opengl' 'python-pyqt5-webengine')
optdepends=('vlc')
optdepends=('livestreamer'
            'youtube-dl'
            'wget'
            'python-opengl-accelerate')
makedepends=('git' 'python-setuptools')

source=("git+https://github.com/kanishka-linux/kawaii-player.git")
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
  PYTHON_VERSION=$(python -c 'import sys; print(str(sys.version_info.major) + "." + str(sys.version_info.minor))')
  install -D "${pkgdir}/usr/lib/python$PYTHON_VERSION/site-packages/kawaii_player/resources/kawaii-player.desktop" "${pkgdir}/usr/share/applications/kawaii-player.desktop"

 sed -i 's/Exec=/Exec=kawaii-player/g' "$pkgdir/usr/share/applications/kawaii-player.desktop"
 install -D $pkgdir/usr/lib/python$PYTHON_VERSION/site-packages/kawaii_player/resources/tray.png $pkgdir/usr/share/kawaii-player/resources/tray.png
}
