# Maintainer: M0Rf30
# Contributor: sirocco
pkgname=italc
pkgver=2.0.2
pkgrel=1
pkgdesc="Classroom management software which enables teachers to view and control computers"
arch=('i686' 'x86_64')
url="http://italc.sourceforge.net/"
license=('GPL')
depends=('qt4' 'libxtst' 'libxinerama' 'openssl' 'libjpeg-turbo' 'zlib')
makedepends=('cmake')
install=$pkgname.install
source=(http://prdownloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2
	italc.service
	italc.desktop)
	
build() {
  cd $srcdir/$pkgname-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DLIB_DIR=/usr/lib
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install DESTDIR=$pkgdir

# Install Icon and Shortcut
  install -D ima/data/italc.xpm $pkgdir/usr/share/pixmaps/italc.xpm
  install -D ../italc.desktop $pkgdir/usr/share/applications/italc.desktop

# Install systemd service	
  install -D ../italc.service $pkgdir/usr/lib/systemd/system/italc.service        
}

md5sums=('c472d438a8807df645111faab6945657'
         '4a00d5f3a8fe08ce614d75d5684a3b1e'
         'c01c880149184705c0a0118f97e7af5c')
