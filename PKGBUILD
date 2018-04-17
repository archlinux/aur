# Contributor: Médéric Boquien <mboquien@free.fr>
pkgname=sofa
pkgver=20180130
pkgrel=1
pkgdesc="Set of algorithms and procedures used in fundamental astronomy"
url="http://www.iausofa.org"
arch=('x86_64' 'i686')
license=('custom')
source=("http://www.iausofa.org/2018_0130_C/sofa_c-${pkgver}.tar.gz")
md5sums=('9d6903c7690e84a788b622fba6f10146')

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
