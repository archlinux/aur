# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=haguichi
pkgver=1.3.7
pkgrel=1
pkgdesc="Provides a user friendly GUI to control the Hamachi client on Linux"
arch=('x86_64' 'i686' 'arm' 'armv7h')
url="http://www.haguichi.net"
license=('GPL3')
depends=('gtk3' 'libnotify' 'logmein-hamachi')
makedepends=('cmake' 'vala')
source=("http://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.xz")
sha256sums=('e769b81a8de9932ea42d0a21431e6c1440ef638472d68ab2d5bebab9c728cfbc')

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
