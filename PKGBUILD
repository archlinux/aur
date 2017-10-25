# Maintainer: kevku <kevku@gmx.com>
pkgname=qesteidutil
pkgver=3.12.7.1252
pkgrel=1
pkgdesc="UI application for managing smart card PIN/PUK codes and certificates"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('qt5-base' 'ccid' 'hicolor-icon-theme')
makedepends=('cmake' 'qt5-tools' 'qt5-translations')
source=("https://installer.id.ee/media/ubuntu/pool/main/q/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('3ff1459d90d7fa9eef676a820271ab7b34c178d72bfcdab166a54272672b3b76')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

build() {
  cd "$srcdir/"
  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_INSTALL_SYSCONFDIR="/etc" -DBREAKPAD="" -DCMAKE_CXX_FLAGS="-pthread"
  make
}

package() {
  cd "$srcdir/"
  make DESTDIR="$pkgdir/" install
}

