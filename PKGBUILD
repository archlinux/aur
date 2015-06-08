#Maintainer: Leonard König <leonard dot r dot koenig at googlemail dot com>
pkgname=sayonara-player-svn
pkgver=r1092
pkgrel=2
pkgdesc="Sayonara is a small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend."
arch=('any')
url="https://sayonara-player.com/"
license=('GPL3')
depends=('qt4' 'curl' 'taglib' 'gst-plugins-base' 'gst-plugins-good' 'libnotify')
optdepends=('lame: mp3 converter, broadcasting'
            'gst-plugins-ugly: mp3 converter, broadcasting')
makedepends=('subversion' 'cmake')
conflicts=('sayonara-player')
install=sayonara-player-svn.install
source=($pkgname::svn+http://sayonara-player.com/svn/sayonara/trunk)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # workaround the reset of the svn-version...
  local sver=$(svnversion)
  local ver=$(($sver + 1042))
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
#  msg "$PWD"
#  msg "$pkgname"
#  msg "$ls"
  cd "$pkgname"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$SRCDEST/$pkgname"
  make prefix=/usr DESTDIR="$pkgdir/" install
}
