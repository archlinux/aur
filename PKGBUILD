# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=enchant-hspell

_pkgname=enchant
pkgver=2.2.15
pkgrel=1

pkgdesc="An enchant provider plugin which adds support for Hspell backend"
url="https://github.com/AbiWord/enchant"

arch=('x86_64')
license=('LGPL')

depends=("enchant-pure" "hspell")
options=('!libtool')

source=("https://github.com/AbiWord/enchant/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('e29b3a85d993af28044a86dd23a3ca74c7d50b4218e542c380053a3eaf70c3ea2406feb3361ba8e793bac586c252330bb20fb56c65f3a0a54f63f103cc0abb35')

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

