# Maintainer: kevku <kevku@gmx.com>
pkgname=libdigidoc
pkgver=3.10.0.1197
pkgrel=1
pkgdesc="Library for creating DigiDoc signature files"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('libxml2' 'openssl')
makedepends=('cmake' 'pcsclite' 'opensc')
conflicts=('libdigidoc-svn' 'sk-libdigidoc-svn')
source=("https://installer.id.ee/media/ubuntu/pool/main/libd/$pkgname/${pkgname}_$pkgver.orig.tar.gz")
sha256sums=('ffbf29ab8ffb2fac6a457e0c6ed6eb3a2a260d171bc278345f8ad8283d200b3b')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_INSTALL_SYSCONFDIR="/etc" -DINSTALL_DOC=NO
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    rm $pkgdir/usr/share/libdigidoc/TEST*
}
