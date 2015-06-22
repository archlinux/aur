# Maintainer: Lubosz Sarnecki <lubosz at gmail>

pkgname=kni
pkgver=4.3.0
distname=KNI_${pkgver}
pkgrel=1
pkgdesc='Katana Native Interface Linux, only for FW 2.2.x'
arch=('i686' 'x86_64')
url='http://www.neuronics.ch'
license=('GPL2')
depends=()
makedepends=()
source=(http://www.neuronics.com/cms_de/mediabase/${distname}.tar.gz
kni-4.3.0.patch)
md5sums=('d4e208d06205a2ce46e52720c1b68eed'
'6a2e972b5fc955a973e3a69c50ad3fb0')
options=(!makeflags)

build() {
  cd ${srcdir}/${distname}
  patch -p1 < ../../kni-4.3.0.patch
  rm include/boost -R
  make
}

package() {
  mkdir -p ${pkgdir}/usr/lib/
  cp -a ${srcdir}/${distname}/lib/linux/*.so ${pkgdir}/usr/lib/
  cp -a ${srcdir}/${distname}/lib/linux/*.a ${pkgdir}/usr/lib/

  mkdir -p ${pkgdir}/usr/include/kni
  cp -R ${srcdir}/${distname}/include/* ${pkgdir}/usr/include/kni
}
