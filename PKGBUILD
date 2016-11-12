# Maintainer: nosada <ngsksdt@gmail.com>

# This package requires too large space (around 3GB).
# You should check having enough space on your storage.

pkgname=knp
pkgver=4.16
pkgrel=2
pkgdesc="KN parser (Kurohashi-Nagao parser) which detects dependency of Japanese sentences"
url="http://nlp.ist.i.kyoto-u.ac.jp/index.php?KNP"
arch=("x86_64" "i686")
license=("custom")
depends=("juman" "tinycdb")      # if you want to use named entity extraction, append 'crfpp' in 'depends' line
source=("http://nlp.ist.i.kyoto-u.ac.jp/DLcounter/lime.cgi?down=http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('ccb64b8baaebe78cbe461b681c909b4875c47dc060a005cfbacd83739b3bcd5ea5ac3cb9769832f1c9726b61bd001362a03e4e1de27d81bff6fb10b6f3a5d0bd')

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
