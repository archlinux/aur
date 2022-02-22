# Maintainer:  Liam Timms <timms5000@gmail.com>
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>
# Contributor: martin <martin pipegrep.co.uk>
pkgname=afni
pkgver=22.0.11
pkgrel=1
pkgdesc="An open-source environment for processing and displaying functional MRI data"
arch=("x86_64")
url="http://afni.nimh.nih.gov"
license=(custom)
depends=("r" "tcsh" "python" "gcc-libs" "gsl" "libxpm" "glu" "openmotif" "libjpeg-turbo" "libxmu" "libxft" "freeglut")
source=("$pkgname-$pkgver.tar.gz::https://github.com/afni/afni/archive/AFNI_$pkgver.tar.gz" "Makefile.patch")
md5sums=('b7080c068fe57aa9d331f7fd7bdc8e1c'
         '2cc1916ecd1e775f52d189f1dd5b0ed9')

prepare() {
  cd "$srcdir"/afni-AFNI_$pkgver/src
  cp Makefile.linux_openmp_64 Makefile
  patch -Np0 -i "$srcdir"/Makefile.patch
}

build() {
  cd "$srcdir"/afni-AFNI_$pkgver/src
  CPPFLAGS=""
  make -j1 vastness
}

package(){
  mkdir -p "$pkgdir"/opt
  cp -r "$srcdir"/build "$pkgdir"/opt/afni
  find "$pkgdir"/opt/afni -name \*.a -delete
  find "$pkgdir"/opt/afni -name \*.h -delete
  mkdir -p "$pkgdir"/usr/share/licenses/afni
  cp "$srcdir"/afni-AFNI_$pkgver/doc/README/README.copyright "$pkgdir"/usr/share/licenses/afni/LICENSE
}
