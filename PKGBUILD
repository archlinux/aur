# Maintainer: kevku <kevku@gmx.com>
pkgname=esteidpkcs11loader
_name=firefox-pkcs11-loader
_browser=firefox
pkgver=3.13.6.1084
pkgrel=1
pkgdesc="Firefox PKCS#11 module loader"
arch=('any')
url="http://www.id.ee/"
license=('LGPL')
depends=('opensc' 'pcsclite' 'ccid')
optdepends=('chrome-token-signing: signing for firefox 52+')
makedepends=('cmake' 'unzip' 'zip')
source=("https://installer.id.ee/media/ubuntu/pool/main/f/$_name/${_name}_$pkgver.orig.tar.xz")
sha256sums=('ddbf1ec00fbc00c79f42d19d786311aae7d170020b35b6fe0693ee9b72cbac23')

build() {
  cd "$srcdir"
  cmake . -DCMAKE_INSTALL_PREFIX="/usr" \
          -DCMAKE_INSTALL_LIBDIR="lib" \
          -DCMAKE_INSTALL_SYSCONFDIR="/etc"
  make
}

package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir/" install
}
