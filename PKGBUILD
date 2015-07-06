# Maintainer: Maxime Morel <maxime@mmorel.eu>

pkgname=opentrack
pkgver=2.3rc13p1
_pkgver=2.3-rc13p1
pkgrel=1
pkgdesc="An application dedicated to tracking user's head movements and relaying the information to games and flight simulation software"
arch=('i686' 'x86_64')
url="https://github.com/opentrack/opentrack/"
license=('GPL3')
depends=('opencv' 'qt5-serialport')
makedepends=('cmake')
source=("https://github.com/opentrack/opentrack/archive/opentrack-$_pkgver.tar.gz" "opentrack.desktop")
sha256sums=('8c75558dff6bef791eadf6e4e25d46994337c7473684c780e7b553acebf09eb6'
            '4d98f03a759d14d1cf6436741135b5b11de9b1975b5dd67407010a13f86fa8e4')

build() {
  cd opentrack-opentrack-$_pkgver 
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DSDK_ENABLE_LIBEVDEV=ON -DCMAKE_INSTALL_PREFIX=/opt/opentrack ..
  make
}

package() {
  cd opentrack-opentrack-$_pkgver/build
  make DESTDIR="$pkgdir" install

  install -Dm644 $srcdir/opentrack.desktop $pkgdir/usr/share/applications/opentrack.desktop
}

