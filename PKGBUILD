# Maintainer: kevku <kevku@gmx.com>
pkgname=esteidpkcs11loader
_browser=firefox
pkgver=3.8.0.1052
pkgrel=1
pkgdesc="Loads PKCS11 module for web authentication with smart cards"
arch=('any')
url="http://www.id.ee/"
license=('LGPL')
depends=('opensc-git' 'esteidcerts' 'ccid')
makedepends=('cmake' 'unzip' 'zip')
conflicts=('esteid-browser-plugin-svn' 'sk-esteidpkcs11loader-svn')
source=("https://installer.id.ee/media/sources/$pkgname-$pkgver.tar.gz"
	"https://installer.id.ee/media/sources/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('331d7fb59554a4cf7c3cce8a263e5248476d994e3124f0b5adc06ba3cad1b091'
            'SKIP')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_INSTALL_SYSCONFDIR="/etc"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/lib/$_browser/browser/extensions"
  cp -r "{aa84ce40-4253-a00a-8cd6-0800200f9a66}" "$pkgdir/usr/lib/$_browser/browser/extensions/"
}
