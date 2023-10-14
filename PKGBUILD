# Contributor: Médéric Boquien <mboquien@free.fr>
pkgname=sofa
pkgver=20231011
pkgrel=1
pkgdesc="Set of algorithms and procedures used in fundamental astronomy"
url="http://www.iausofa.org"
arch=('x86_64')
license=('custom')
source=("http://www.iausofa.org/2023_1011_C/sofa_c-${pkgver}.tar.gz")
sha512sums=('8e7d67f7ac7a285a96160c96d16b1921ccb7a9324b83280b1594efcbbd7eb78c4d41898c1e5acfa5081842e4aeee15a96572d21b466bfda7ef7582c58624d376')

build() {
  cd "${srcdir}/${pkgname}/${pkgver}/c/src"
  make CFLAGF="-c -O -fPIC"
}

package() {
  cd "${srcdir}/${pkgname}/${pkgver}/c/src"
  make INSTALL_DIR="${pkgdir}/usr" install

  cd "${srcdir}/${pkgname}/${pkgver}/c/"
  install -Dm644 00READ.ME "$pkgdir/usr/share/doc/$pkgname/00READ.ME"
  install -m644 doc/*.lis "$pkgdir/usr/share/doc/$pkgname/"
}
