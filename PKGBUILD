# Maintainer: kevku <kevku@gmx.com>
pkgname=qdigidoc
pkgver=3.11.0.1416
pkgrel=1
pkgdesc="Qt based UI application for verifying and signing digital signatures"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('libdigidocpp' 'qt5-base' 'libldap' 'shared-mime-info' 'esteidcerts' 'ccid' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake' 'opensc' 'qt5-tools' 'qt5-translations')
conflicts=('qdigidoc-svn' 'sk-qdigidoc-svn')
install=qdigidoc.install
source=("https://installer.id.ee/media/ubuntu/pool/main/q/$pkgname/${pkgname}_$pkgver.orig.tar.xz" 
        "qt55.patch")
sha256sums=('db9f8e4b99e6b3a9448408d9c25f39698830c7ea9b11c29740c8ff91c3635e4a'
            '41c19de0ec48b231b24e0bfacae6c0ee9f1f21d0e87c10b3ae6c2c679b793701')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

prepare(){
 cd "$srcdir/"
 patch -Np1 -i "$srcdir/qt55.patch"
}

build() {
  cd "$srcdir/"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_INSTALL_SYSCONFDIR="/etc"
  make
}

package() {
  cd "$srcdir/"
  make DESTDIR="$pkgdir/" install
}
