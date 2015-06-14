# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=('enchant-hspell')

_pkgname=enchant
pkgver=1.6.0
pkgrel=2

pkgdesc="An enchant provider plugin which adds support for Hspell backend"
url="http://www.abisource.com/enchant/"

arch=('any')
license=('LGPL')

depends=("enchant-pure" "hspell")
options=('!libtool')

source=("http://www.abisource.com/downloads/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "warnings-fix.patch")
sha512sums=('0ca1634bb783df51512df4abecc89abdadee6baf7330d6e5f90cc15d10779896a3521a1c079ecc07e4df4f7a018ce398cca9d0125a7845a314a059840ebc9137'
            'de32bce6c0b364eaf8142fd65c1a9afa0909dcfba4c17ad10626fb38db355f314baade75c6d5f4b3fbedd04917400b2e3d10b898cfe7a006883b2e32520ab79e')

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

