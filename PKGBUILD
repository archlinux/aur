# Maintainer: kevku <kevku@gmx.com>
pkgname=esteidpkcs11loader
_name=firefox-pkcs11-loader
_browser=firefox
pkgver=3.13.3.1076
pkgrel=1
pkgdesc="Firefox PKCS#11 module loader"
arch=('any')
url="http://www.id.ee/"
license=('LGPL')
depends=('opensc' 'pcsclite' 'ccid')
optdepends=('chrome-token-signing: signing for firefox 52+')
makedepends=('cmake' 'unzip' 'zip')
source=("https://installer.id.ee/media/ubuntu/pool/main/f/$_name/${_name}_$pkgver.orig.tar.xz")
sha256sums=('9eb4027760d6b05afb818ab41a59f6c91f0ee43c7923e95e8b322dc8466d11ba')

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
