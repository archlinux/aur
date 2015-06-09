# Maintainer: nosada <ngsksdt@gmail.com>

# This package requires too large space (around 3GB).
# You should check having enough space on your storage.

pkgname=knp
pkgver=4.12
pkgrel=1
pkgdesc="KN parser (Kurohashi-Nagao parser) which detects dependency of Japanese sentences"
url="http://nlp.ist.i.kyoto-u.ac.jp/index.php?KNP"
arch=("x86_64" "i686")
license=("custom")
depends=("juman>=7.0" "tinycdb")      # if you want to use named entity extraction, append 'crfpp' in 'depends' line
source=("http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/knp/${pkgname}-${pkgver}.tar.bz2")
sha1sums=("715246971b758330714e27348e83cd95b1fa7feb")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  # if you want to use named entity extraction, comment out above and uncomment below
  #./configure --prefix=/usr --with-crf
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
