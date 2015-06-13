# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=('enchant-hspell')

_pkgname=enchant
pkgver=1.6.0
pkgrel=1

pkgdesc="An enchant provider plugin which adds support for Hspell backend"
url="http://www.abisource.com/enchant/"

arch=('any')
license=('LGPL')

depends=("enchant-pure" "hspell")
options=('!libtool')

source=("http://www.abisource.com/downloads/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "warnings-fix.patch")
sha1sums=('321f9cf0abfa1937401676ce60976d8779c39536'
          '8e23f2b350e77c2a2e9accf1ce1b9a18aefb69ff')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ../warnings-fix.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static --disable-ispell --disable-myspell --disable-aspell --disable-voikko --disable-uspell --disable-zemberek --enable-hspell
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -D -s -m 755 src/hspell/.libs/libenchant_hspell.so "${pkgdir}/usr/lib/enchant/libenchant_hspell.so"
}

