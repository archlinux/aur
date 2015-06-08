# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=bareftp
pkgver=0.3.11
pkgrel=1
pkgdesc="bareFTP a file transfer client supporting the FTP, FTPS and SFTP protocols"
arch=('i686' 'x86_64')
url="http://www.bareftp.org/"
license=('GPL')
depends=('gnome-sharp>=2' 'gnome-icon-theme' 'gnome-keyring-sharp' 'mono>=2')
makedepends=('intltool>=0.35' 'pkgconfig>=0.9')
install=$pkgname.install
source=(http://www.bareftp.org/release/$pkgname-$pkgver.tar.gz
        fix.patch)
sha256sums=('cafc6cd6f71ee6e6151cadc517349646977d90b372850e194ad505d89aa6682f'
            '2d4a99fe5ff363a7dc97d1abb85fb8f124ee4935801855eef656b0c089c2a5c3')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  export MONO_SHARED_DIR=$(pwd)
  ./configure --prefix=/usr
  patch -p1 -i ../fix.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

