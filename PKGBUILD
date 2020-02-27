# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=enchant-hspell

_pkgname=enchant
pkgver=2.2.8
pkgrel=1

pkgdesc="An enchant provider plugin which adds support for Hspell backend"
url="https://github.com/AbiWord/enchant"

arch=('x86_64')
license=('LGPL')

depends=("enchant-pure" "hspell")
options=('!libtool')

source=("https://github.com/AbiWord/enchant/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('4bfa771af0deab3d0ca5523abab1fdb14cb596747dba7cf887e8cd812601015f52502cbd3df68247f102bba259cb281414e9ccde83b8bdd3c8cc83c2fcbc9090')

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

