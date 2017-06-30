# Maintainer: kevku <kevku@gmx.com>
pkgname=libdigidocpp
pkgver=3.13.0.1353
pkgrel=1
pkgdesc="Library for creating DigiDoc signature files"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('xml-security-c' 'libdigidoc')
makedepends=('cmake' 'xsd>=4.0' 'pcsclite' 'opensc' 'xxd')
source=("https://installer.id.ee/media/ubuntu/pool/main/libd/$pkgname/${pkgname}_$pkgver.orig.tar.xz"
        "fix-compile-3.13.0.1353.patch")
sha256sums=('fc34c1344891dfebc28e539858d2c72942014469e8deabba57bbae3a5c4ade50'
            '995880ab4f84f01fbe44b6b4a87c0d70fbf534e4ecf7969e751a008841e94afe')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

build() {
  cd "$srcdir/"
  patch -p1 -i fix-compile-3.13.0.1353.patch
  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_INSTALL_SYSCONFDIR="/etc" -DINSTALL_DOC=NO -DSWIG_EXECUTABLE="" -DBoost_INCLUDE_DIR="" -DMINIZIP_INCLUDE_DIR=""
  make
}

package() {
  cd "$srcdir/"
  make DESTDIR="$pkgdir/" install
}
