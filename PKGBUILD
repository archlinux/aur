# Maintainer: Chris Hobbs (RX14) <chris@rx14.co.uk>
pkgname=timecamp
pkgver=2.1.1.0
pkgrel=1
pkgdesc="Client application for TimeCamp software"
arch=('any')
url="https://github.com/timecamp/timecamp-v2.1-desktop-app"
license=('GPL3')
depends=('qt5-base' 'qt5-webengine' 'qt5-x11extras')
makedepends=('cmake')
source=("timecamp-${pkgver}.tar.gz::https://github.com/timecamp/timecamp-v2.1-desktop-app/archive/${pkgver}.tar.gz"
        "timecamp.desktop")
sha256sums=('1ed3904dc3b99f4a84a637dbeb8d5d130e0d31859fdf7ce34229b374b24183c8'
            '632c47beefd1aae80eb3ea51832fd74e43f11ed6432f5dc7dded867c80d5df70')
build() {
  cd "$srcdir/timecamp-v2.1-desktop-app-${pkgver}"

  cp CMakeProjectConfig.cmake.example CMakeProjectConfig.cmake

  mkdir build
  cd build

  cmake ..
  make
}

package() {
  cd "$srcdir/timecamp-v2.1-desktop-app-${pkgver}"

  install -D -m755 build/TimeCampDesktop "$pkgdir/usr/bin/timecamp"
  install -D -m644 res/AppIcon_48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/timecamp.png"
  install -D -m644 res/AppIcon_256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/timecamp.png"
  install -D -m644 "$srcdir/timecamp.desktop" "$pkgdir/usr/share/applications/timecamp.desktop"
}
