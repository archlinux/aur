# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=('enchant-hspell')

_pkgname=enchant
pkgver="2.2.1"
pkgrel=1

pkgdesc="An enchant provider plugin which adds support for Hspell backend"
url="https://github.com/AbiWord/enchant"

arch=('any')
license=('LGPL')

depends=("enchant-pure" "hspell")
options=('!libtool')

source=("https://github.com/AbiWord/enchant/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('e33cceab47e18803a3893aea0f954fc83f108205cffe9f4597b86cad8ee5c2b1e5ab0a5db61c9412acae1109274427315dd747438843545c48bf14f51a2c7545')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-static=no --with-hspell=yes --with-aspell=no --with-hunspell=no --with-voikko=no --with-zemberek=no --with-applespell=no
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -D -s -m 755 providers/.libs/enchant_hspell.so "${pkgdir}/usr/lib/enchant-2/libenchant_hspell.so"
}

