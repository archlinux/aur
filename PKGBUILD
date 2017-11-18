# Maintainer: robertfoster
# Contributor: sirocco

pkgname=italc
pkgver=3.0.3
pkgrel=2
pkgdesc="Classroom management software which enables teachers to view and control computers"
arch=('i686' 'x86_64')
url="http://italc.sourceforge.net/"
license=('GPL')
depends=('qt5-base' 'libxrandr' 'libxtst' 'pam' 'openssl' 'libjpeg-turbo' 'zlib')
makedepends=('cmake' 'qt5-tools')
install=$pkgname.install
source=("https://github.com/iTALC/italc/archive/v$pkgver.tar.gz"
	italc.service
	italc.desktop)
	
build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  cd build  
  make install DESTDIR=$pkgdir
  cd ..

# Install Icon and Shortcut
  install -D ima/data/italc.xpm $pkgdir/usr/share/pixmaps/italc.xpm
  install -D ../italc.desktop $pkgdir/usr/share/applications/italc.desktop

# Install systemd service	
  install -D ../italc.service $pkgdir/usr/lib/systemd/system/italc.service        
}

md5sums=('c52919cd6d726c4cc7a85bc5bea6c376'
         '4a00d5f3a8fe08ce614d75d5684a3b1e'
         'c01c880149184705c0a0118f97e7af5c')
