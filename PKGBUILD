# Contributor: Médéric Boquien <mboquien@free.fr>
pkgname=sofa
pkgver=20210512
pkgrel=1
pkgdesc="Set of algorithms and procedures used in fundamental astronomy"
url="http://www.iausofa.org"
arch=('x86_64')
license=('custom')
source=("http://www.iausofa.org/2021_0512_C/sofa_c-${pkgver}.tar.gz")
sha512sums=('c201766b82b2ed4cb67bacf2a798b0a3734544d058bbc22be1eea7468b1d7f762ab9ca2c163c5bc6e3d2df87a71115770e264f72076ddd7525b1c543d9168d8f')

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
