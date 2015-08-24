# Maintainer: lukas (lukas <dot> graetz <at> web <dot>  de)
pkgname=nxtrc
pkgver=2.3
pkgrel=4
pkgdesc="A tool for communicating with lego nxt brick over bluetooth"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.scienzaludica.it/index.php?page=88"
depends=('bluez-libs')
source=("http://www.scienzaludica.it/files/${pkgname}-${pkgver}.tar.gz"
        "nxtrc-fix-looping.patch")
md5sums=('d4be8bafe65e6336363a515ed5199ccc'
         '37316df0b601c1c87009757b7c92dd80')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/nxtrc-fix-looping.patch"
  ./configure --prefix=/usr
  make
  # FIXME: Howto put that stuff in the Makefile?
  echo gcc -Wall -shared -fPIC -dPIC -c nxtrc_func.c -o libnxtrc.so -lbluietooth ${CFLAGS}
       gcc -Wall -shared -fPIC -dPIC -c nxtrc_func.c -o libnxtrc.so -lbluietooth ${CFLAGS}
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
  mkdir -p ${pkgdir}/usr/lib
  echo install libnxtrc.so ${pkgdir}/usr/lib
       install libnxtrc.so ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/include
  echo install -m 644 nxtrc_func.h ${pkgdir}/usr/include
       install -m 644 nxtrc_func.h ${pkgdir}/usr/include
}

