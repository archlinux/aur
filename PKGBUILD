# Maintainer: kevku <kevku@gmx.com>
pkgname=esteidpkcs11loader
pkgver=3.13.6.1084
_rls_tag=v3.13.6
pkgrel=2
pkgdesc="Firefox PKCS#11 module loader"
arch=('any')
url="http://www.id.ee/"
license=('LGPL')
depends=('opensc' 'pcsclite' 'ccid')
optdepends=('chrome-token-signing: signing for firefox 52+')
makedepends=('cmake' 'unzip' 'zip' 'git')
source=("$pkgname-$pkgver::git+https://github.com/open-eid/firefox-pkcs11-loader.git?signed#tag=$_rls_tag")
sha256sums=("SKIP")
validpgpkeys=(
    'D1EBC666EFCBFBD3CFC2EBAA90C0B5E75C3B195D'  # Raul Metsma
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake . -DCMAKE_INSTALL_PREFIX="/usr" \
          -DCMAKE_INSTALL_LIBDIR="lib" \
          -DCMAKE_INSTALL_SYSCONFDIR="/etc"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
