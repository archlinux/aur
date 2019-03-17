#
# Maintainer: Ste74 <capitani74atgmaildotcom>
# Author: echo-devim <devimatoutlook.it>

pkgname=slingswarm
pkgver=1.0
pkgrel=2
pkgdesc="GTK3 application launcher similar to Mac OS launchpad and Wayland compatible. "
arch=('x86_64')
url="https://github.com/echo-devim/$pkgname"
_commit=34e2e0446381ffbbcac7ba530286b6d10010f2a5
license=('GPL3')
depends=('libgee' 'gnome-menus' 'glib2' 'gtk3')
makedepends=('cmake' 'vala0.26')
install=$pkgname.install
source=("$url/archive/$_commit.tar.gz")
sha256sums=('fcf9c41aa0dfcc68f9dc09d600b801c501c40d7e993154834357bbdf58745504')

prepare() {
  mv $pkgname-$_commit $pkgname-$pkgver
}

build() {
  cd $pkgname-$pkgver/build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
