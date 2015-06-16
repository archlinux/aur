# Maintainer: kevku <kevku@gmx.com>
pkgname=libdigidocpp
pkgver=3.10.0.1281
pkgrel=1
pkgdesc="Library for creating DigiDoc signature files"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('xml-security-c' 'minizip' 'libdigidoc')
makedepends=('cmake' 'xsd>=4.0' 'pcsclite' 'opensc')
conflicts=('libdigidocpp-svn' 'sk-libdigidocpp-svn')
source=("https://installer.id.ee/media/ubuntu/pool/main/libd/$pkgname/${pkgname}_$pkgver.orig.tar.gz")
sha256sums=('da51ba2944c72018d8482ab85d76159bbf66e8867b3e36d144e77d21c98d15bc')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_INSTALL_SYSCONFDIR="/etc" -DINSTALL_DOC=NO -DSWIG_EXECUTABLE=""
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
