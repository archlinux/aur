# Contributor: Médéric Boquien <mboquien@free.fr>
# Contributor: Roelof Rietbroek <roelof@wobbly.earth>
pkgname=sofa-shared
pkgver=20180130
pkgrel=1
pkgdesc="Set of algorithms and procedures used in fundamental astronomy (shared C-library version)"
url="http://www.iausofa.org"
arch=('x86_64' 'i686')
license=('SOFA license')
source=("http://www.iausofa.org/2018_0130_C/sofa_c-${pkgver}.tar.gz" "makefile.patch")
md5sums=('9d6903c7690e84a788b622fba6f10146'
         'fe06c75a994a6dd11ef082361b4bb968')

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

