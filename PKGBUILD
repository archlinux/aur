# Contributor: Médéric Boquien <mboquien@free.fr>
# Contributor: Roelof Rietbroek <roelof@wobbly.earth>
pkgname=sofa-shared
pkgver=20231011
pkgrel=1
pkgdesc="Set of algorithms and procedures used in fundamental astronomy (shared C-library version)"
url="http://www.iausofa.org"
arch=('x86_64' 'i686')
license=('SOFA license')
source=("http://www.iausofa.org/2023_1011_C/sofa_c-${pkgver}.tar.gz" "makefile.patch")
sha256sums=('d9c10833cae8b4d9361a0ffda31ec361fd1262362025bec4d4e51a880150ace2'
            '267ffd5eb65e8cbb2e5122f1705fd627c20570b5ac10a5e7049a4b9dfcc29128')

prepare() {
    cd ${srcdir}
    patch "sofa/${pkgver}/c/src/makefile" makefile.patch
    
}


build() {
  cd "${srcdir}/sofa/${pkgver}/c/src"
  make CFLAGF="-c -O -fPIC"
}

package() {
  cd "${srcdir}/sofa/${pkgver}/c/src"
  make INSTALL_DIR="${pkgdir}/usr" install

  cd "${srcdir}/sofa/${pkgver}/c/"
  install -Dm644 00READ.ME "$pkgdir/usr/share/doc/sofa/00READ.ME"
  install -m644 doc/*.lis "$pkgdir/usr/share/doc/sofa/"
}

