# Maintainer: Martin Brodbeck <martin at brodbeck-online dot de>
pkgname=bibellese
pkgver=1.6.2
pkgrel=1
pkgdesc="Helps with reading the bible according to various reading plans (German only)"
arch=('i686' 'x86_64')
url="http://www.brodbeck-online.de/software/bibellese"
license=('custom')
depends=('glibc' 'libical' 'qt5-base')
makedepends=('boost>=1.47')
source=($pkgname-$pkgver.tar.gz)
md5sums=('61550d90ef251296a85254ebfd4913ba')

build() {
  if [ ! -d Bibellese/build ]; then
    mkdir Bibellese/build
  fi
  cd Bibellese/build

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr ..
  make
}

package() {
  mkdir -p $pkgdir/usr/share/bibellese/data
  cd Bibellese/build
  make install
  cd ..
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
