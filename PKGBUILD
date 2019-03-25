# Maintainer: Martin <martin at pipegrep dot co dot uk> 
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>
pkgname=afni
pkgver=19.0.26
pkgrel=1
pkgdesc="An open-source environment for processing and displaying functional MRI data"
arch=("x86_64")
url="http://afni.nimh.nih.gov"
license=(custom)
depends=("tcsh" "python" "gcc-libs" "gsl" "libxpm" "glu" "openmotif" "libjpeg-turbo" "libxmu" "libxft")
source=("$pkgname-$pkgver.tar.gz::https://github.com/afni/afni/archive/AFNI_$pkgver.tar.gz" "Makefile.patch")
md5sums=("ab2fa5c3562c0cfe5fd62753f6b1def7"
         "2cc1916ecd1e775f52d189f1dd5b0ed9")

prepare() {
  cd "$srcdir"/afni-AFNI_$pkgver/src
  cp Makefile.linux_openmp_64 Makefile
  patch -Np0 -i "$srcdir"/Makefile.patch
}

build() {	
  cd "$srcdir"/afni-AFNI_$pkgver/src
  CPPFLAGS=""
  make vastness
}

package(){
  mkdir -p "$pkgdir"/opt
  cp -r "$srcdir"/build "$pkgdir"/opt/afni
  find "$pkgdir"/opt/afni -name \*.a -delete
  find "$pkgdir"/opt/afni -name \*.h -delete
  mkdir -p "$pkgdir"/usr/share/licenses/afni
  cp "$srcdir"/afni-AFNI_$pkgver/doc/README/README.copyright "$pkgdir"/usr/share/licenses/afni/LICENSE
}
