# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: CareF <CareF.lm@gmail.com>
# Contributor: Xavier Peng <png.inside@gmail.com>

pkgname=one-click-bing-wallpaper-git
_name=BingWallpaper
pkgver=r137.e1e4133
pkgrel=1
pkgdesc="A Qt-based program for setting newest Bing Wallpaper, just click the tray icon"
arch=('i686' 'x86_64')
url="https://github.com/ypingcn/BingWallpaper"
makedepends=('qt5-base' 'git')
optdepends=('feh: common WM support' 'xfconf: xfce support' 'glib2: deepin and cinnamon support')
depends=('python-requests' 'dtkwidget' 'libnotify')
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
