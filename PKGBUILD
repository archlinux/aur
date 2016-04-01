# Maintainer: Maxime Morel <maxime@mmorel.eu>

pkgname=opentrack
pkgver=2.3rc21p11
_pkgver=2.3-rc21p11
pkgrel=1
pkgdesc="An application dedicated to tracking user's head movements and relaying the information to games and flight simulation software"
arch=('i686' 'x86_64')
url="https://github.com/opentrack/opentrack/"
license=('GPL3')
depends=('opencv-git' 'libwebp')
makedepends=('cmake')
source=("https://github.com/opentrack/opentrack/archive/opentrack-$_pkgver.tar.gz" "opentrack.desktop")
sha256sums=('0b7edcf35071ae6f227c3a94505df245ebdc9026ce5a34e04d694aa675b1efbc'
            '375f21f8dcbe9e6211aba0570a186042adb2b8c671a830d8da3046fec3b07673')

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

