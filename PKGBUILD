# Maintainer: kevku <kevku@gmx.com>
pkgname=qesteidutil
pkgver=3.10.1.1187
pkgrel=1
pkgdesc="UI application for managing smart card PIN/PUK codes and certificates"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('qt5-base' 'ccid' 'esteidcerts' 'hicolor-icon-theme')
makedepends=('cmake' 'qt5-tools' 'qt5-translations')
conflicts=('qesteidutil-svn' 'smartcardpp-svn' 'sk-qesteidutil-svn' 'sk-smartcardpp-svn')
install=qesteidutil.install
source=("https://installer.id.ee/media/ubuntu/pool/main/q/$pkgname/${pkgname}_$pkgver.orig.tar.gz"
        "qt55.patch")
sha256sums=('542ece38ad378a9f6f3fced060e58efce5b412b3606543bbd3d17b6179c5b92e'
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

