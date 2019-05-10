# Maintainer: CareF <CareF.lm@gmail.com>
# Maintainer: Xavier Peng <png.inside@gmail.com>

pkgname=one-click-bing-wallpaper-git
_name=BingWallpaper
pkgver=r114.a8c2c27
pkgrel=2
pkgdesc="A Qt-based program for setting newest Bing Wallpaper, just click the tray icon"
arch=('i686' 'x86_64')
url="https://github.com/ypingcn/BingWallpaper"
makedepends=('qt5-base')
optdepends=('feh: common WM support' 'xfconf: xfce support' 'glib2: deepin and cinnamon support')
depends=('python-requests' 'python-argparse' 'dtkwidget' 'libnotify')
license=('GPL3')
source=(git+https://github.com/ypingcn/BingWallpaper.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/"$_name" || exit 1
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
  cd "$srcdir"/"$_name" || exit 1
  ./config.sh
  qmake OneClickBingWallpaper.pro
  make
}

package() {
  cd "$srcdir"/"$_name" || exit 1
  make install INSTALL_ROOT="$pkgdir"
}
