# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=enchant-hspell

_pkgname=enchant
pkgver=2.2.11
pkgrel=1

pkgdesc="An enchant provider plugin which adds support for Hspell backend"
url="https://github.com/AbiWord/enchant"

arch=('x86_64')
license=('LGPL')

depends=("enchant-pure" "hspell")
options=('!libtool')

source=("https://github.com/AbiWord/enchant/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('7d9014f6d3798120eddcfe58dd5efdb04d8b10046ecd66526e75342fe33d4c8cb55ab12d377a8ff2d817374161ce36f39fdb1584b711dd61d61491f8082fa91f')

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

