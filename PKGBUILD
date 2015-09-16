# Maintainer: kevku <kevku@gmx.com>
pkgname=libdigidoc
pkgver=3.10.1.1208
pkgrel=1
pkgdesc="Library for creating DigiDoc signature files"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('libxml2' 'openssl')
makedepends=('cmake' 'pcsclite' 'opensc')
conflicts=('libdigidoc-svn' 'sk-libdigidoc-svn')
source=("https://installer.id.ee/media/ubuntu/pool/main/libd/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('a7de5e93baccd2d807232dbbe9b4dde72e08921c9a414a719fe275d8d6e40cd6')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

build() {
    cd "$srcdir/"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_INSTALL_SYSCONFDIR="/etc" -DINSTALL_DOC=NO
    make
}

package() {
    cd "$srcdir/"
    make DESTDIR="$pkgdir/" install
    rm $pkgdir/usr/share/libdigidoc/TEST*
}
