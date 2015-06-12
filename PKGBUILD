# Maintainer: jose <jose1711 [at] gmail (dot) com>
# Contributor: josephgbr

pkgname=racer
pkgver=1.1.1
pkgrel=4
pkgdesc="2D car racing game"
arch=('i686' 'x86_64')
url="http://hippo.nipax.cz/download.cz.php?id=64"
license=("GPL2")
if [ $CARCH == i686 ]; then
    depends=('allegro4' 'libjpeg')
elif [ $CARCH == x86_64 ]; then
    depends=('lib32-allegro4' 'lib32-libjpeg-turbo' 'lib32-gcc-libs')
    makedepends=('gcc-multilib')
fi
source=("http://hippo.nipax.cz/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('7f2c8982e3960d0282117b57ac749de1')
install=racer.install

build() {
  cd ${pkgname}-${pkgver}
  [ $CARCH = x86_64 ] && sed "s#g++#g++ -m32#" -i src/Makefile
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}"/usr install
}
