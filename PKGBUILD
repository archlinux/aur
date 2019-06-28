# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=('enchant-hspell')

_pkgname=enchant
pkgver="2.2.4"
pkgrel=1

pkgdesc="An enchant provider plugin which adds support for Hspell backend"
url="https://github.com/AbiWord/enchant"

arch=('any')
license=('LGPL')

depends=("enchant-pure" "hspell")
options=('!libtool')

source=("https://github.com/AbiWord/enchant/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('3860f04e276e1afa8969041b3f57411136d6b96ecf90996cdb122739e87be432f12219d2635c29d2e7ef3f2eeb366013026b6f8327a9749ffbc3a1dfafb4b870')

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

