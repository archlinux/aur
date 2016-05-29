# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=haguichi
pkgver=1.3.4
pkgrel=1
pkgdesc="Provides a user friendly GUI to control the Hamachi client on Linux"
arch=('x86_64' 'i686' 'arm' 'armv7h')
url="http://www.haguichi.net"
license=('GPL3')
depends=('gtk3' 'libnotify' 'logmein-hamachi')
makedepends=('cmake' 'vala')
source=("http://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.xz")
sha256sums=('985cfdd08e1b7e8864116b5f5834d2d99fb24a0b698808d8a66e7fe77bca5125')

prepare() {
  cd $pkgname-$pkgver

  rm -rf build
  mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DICON_UPDATE=OFF -DGSETTINGS_COMPILE=OFF
  make
}

package() {
  make -C $pkgname-$pkgver/build DESTDIR="$pkgdir" install
}
