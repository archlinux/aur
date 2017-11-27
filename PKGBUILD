# Maintainer: kevku <kevku@gmx.com>
pkgname=libdigidocpp
pkgver=3.13.2.1355
pkgrel=4
pkgdesc="Library for creating, signing and verification of digitally signed documents, according to XAdES and XML-DSIG standards."
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('xml-security-c')
makedepends=('cmake' 'xsd>=4.0' 'xxd')
source=("https://installer.id.ee/media/ubuntu/pool/main/libd/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('5f48ecaf79813a6bbd267479dd21ca0a0a984c41ac37587e5b29dc8b688096c2')

prepare() {
  [[ -d "$pkgname-build" ]] && rm -r "$pkgname-build"
  mkdir "$pkgname-build"
}

build() {
  cd "$pkgname-build"
  cmake .. -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DCMAKE_INSTALL_SYSCONFDIR="/etc" \
           -DSWIG_EXECUTABLE="" \
           -DBoost_INCLUDE_DIR="" \
           -DMINIZIP_INCLUDE_DIR="" \
           -DLIBDIGIDOC_INCLUDE_DIR=""
  make
}

package() {
  cd "$pkgname-build"
  make DESTDIR="$pkgdir/" install
}
