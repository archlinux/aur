# Maintainer: kevku <kevku@gmx.com>
pkgname=qesteidutil
pkgver=3.12.9.1261
pkgrel=1
pkgdesc="UI application for managing smart card PIN/PUK codes and certificates"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL2.1')
depends=('qt5-base' 'opensc' 'ccid' 'hicolor-icon-theme')
makedepends=('cmake' 'qt5-tools' 'qt5-translations')
source=("https://installer.id.ee/media/ubuntu/pool/main/q/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('f69a8113f0e4ace91d98ea9d95cc69efaae4297cd9e7cdd2006695401afc6321')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

build() {
  cd "$srcdir/"
  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_INSTALL_SYSCONFDIR="/etc" -DBREAKPAD=""
  make
}

package() {
  cd "$srcdir/"
  make DESTDIR="$pkgdir/" install
}

