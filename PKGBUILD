# Maintainer: kevku <kevku@gmx.com>
pkgname=libdigidoc
pkgver=3.10.1.1212
pkgrel=2
pkgdesc="Library for creating DigiDoc signature files"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('libxml2' 'openssl')
makedepends=('cmake' 'pcsclite' 'opensc')
source=("https://installer.id.ee/media/ubuntu/pool/main/libd/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('ad5e0603aea2e02977f17318cc93a53c3a19a815e57b2347d97136d11c110807')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

build() {
    cd "$srcdir/"
    export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_INSTALL_SYSCONFDIR="/etc" -DINSTALL_DOC=NO
    make
}

package() {
    cd "$srcdir/"
    make DESTDIR="$pkgdir/" install
    rm $pkgdir/usr/share/libdigidoc/TEST*
}
