# Maintainer: Maxime Morel <maxime@mmorel.eu>

pkgname=opentrack
pkgver=2.3rc21p11
_pkgver=2.3-rc21p11
pkgrel=3
pkgdesc="An application dedicated to tracking user's head movements and relaying the information to games and flight simulation software"
arch=('i686' 'x86_64')
url="https://github.com/opentrack/opentrack/"
license=('GPL3')
depends=('qt5-base' 'opencv')
makedepends=('cmake')
source=("https://github.com/opentrack/opentrack/archive/opentrack-$_pkgver.tar.gz" "opentrack.desktop")
sha256sums=('0b7edcf35071ae6f227c3a94505df245ebdc9026ce5a34e04d694aa675b1efbc'
            'e39d8d68739f875393c4b0bec61aacf5d2fa7970327c82d9b4e97f643e4fb0cc')

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

