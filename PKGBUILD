# $Id$
# Maintainer:  goetzc
# Contributor: birdflesh, Laurent Carlier

_realname=kde-gtk-config
pkgname=kde-gtk-config-kde4
pkgver=2.2.1
pkgrel=2
pkgdesc="GTK2 and GTK3 Configurator for KDE4"
arch=('i686' 'x86_64')
url="https://projects.kde.org/kde-gtk-config"
license=('GPL3')
depends=('kdelibs')
makedepends=('cmake' 'automoc4' 'gtk2' 'gtk3')
optdepends=('gtk2: GTK+ v2 support'
	        'gtk3: GTK+ v3 support')
provides=kde-gtk-config
conflicts=kde-gtk-config
source=("http://download.kde.org/stable/$_realname/$pkgver/src/$_realname-$pkgver.tar.xz")
md5sums=('d155ed431d509e54a60383a70b700e1c')
install=$pkgname.install

build() {
  cd "$srcdir"

  mkdir -p build && cd build

  cmake ../$_realname-$pkgver \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}
