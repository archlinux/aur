# Maintainer: kevku <kevku@gmx.com>
pkgname=qdigidoc
pkgver=3.10.0.1401
pkgrel=2
pkgdesc="Qt based UI application for verifying and signing digital signatures"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('libdigidocpp' 'qt5-base' 'libldap' 'shared-mime-info' 'esteidcerts' 'ccid' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake' 'opensc' 'qt5-tools' 'qt5-translations')
conflicts=('qdigidoc-svn' 'sk-qdigidoc-svn')
install=qdigidoc.install
source=("https://installer.id.ee/media/ubuntu/pool/main/q/$pkgname/${pkgname}_$pkgver.orig.tar.gz" 
        "qt55.patch")
sha256sums=('e11cfd491de715472435887e0bdcda2ab82d45d1ce14718a28a8420875ce601c'
            '41c19de0ec48b231b24e0bfacae6c0ee9f1f21d0e87c10b3ae6c2c679b793701')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

prepare(){
 cd "$srcdir/$pkgname-$pkgver"
 patch -Np1 -i "$srcdir/qt55.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_INSTALL_SYSCONFDIR="/etc"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
