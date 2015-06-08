# Maintainer: Antonio Rojas < nqn1976 @ gmail.com >
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: motyR <moty.rahamim@gmail.com>

pkgname=kio-locate
pkgver=0.5.3
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="A KDE I/O Slave for the locate command"
url="http://kde-apps.org/content/show.php?content=120965"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4' 'docbook-xsl')
source=("http://kde-apps.org/CONTENT/content-files/120965-$pkgname-$pkgver.tar.gz" "kio_locate_gcc47.patch")
md5sums=('198b43f6c873863bd02113db0ffe29bb'
         '270660f80c69d3a6b0a39dbdbaf672eb')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p0 -i $srcdir/kio_locate_gcc47.patch
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_RPATH=ON -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd $srcdir/$pkgname-$pkgver/build
  make DESTDIR=$pkgdir install
}
