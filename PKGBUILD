# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=haguichi
pkgver=1.3.5
pkgrel=1
pkgdesc="Provides a user friendly GUI to control the Hamachi client on Linux"
arch=('x86_64' 'i686' 'arm' 'armv7h')
url="http://www.haguichi.net"
license=('GPL3')
depends=('gtk3' 'libnotify' 'logmein-hamachi')
makedepends=('cmake' 'vala')
source=("http://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.xz")
sha256sums=('f5321d8e88d997675f00874d151fe82d7b44f3ef174e1a89052d2aedf179b0e2')

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
