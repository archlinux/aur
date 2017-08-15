# Maintainer: Sergio Correia <sergio@correia.cc>

pkgname=evalvid
pkgver=2.7
pkgrel=1
pkgdesc="A framework and tool-set for evaluation of the quality of video transmitted over a real
or simulated communication network."
url="http://www2.tkn.tu-berlin.de/research/evalvid/fw.html"
license=('unknown')
arch=('x86_64')
depends=('openssl' 'libpng' 'libjpeg-turbo')
makedepends=('gpac')
source=("http://www2.tkn.tu-berlin.de/research/evalvid/EvalVid/${pkgname}-${pkgver}.tar.bz2"
        evalvid-compile-fixes.patch)
noextract=("${pkgname}-${pkgver}.tar.bz2")
sha256sums=('9f4872f218427fe10560400a73144fc0be5d7a003429294190bbf00dc0866692'
            '825c4622049cacbefd1d15ae20804ba3b6ef31e366124a331f3fbff774a33822')

prepare() {
  mkdir -p  "${srcdir}/${pkgname}-${pkgver}"
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  tar xf ../${pkgname}-${pkgver}.tar.bz2
  patch -uNp1 -i ../evalvid-compile-fixes.patch
}

build() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  make
}

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  make INSTDIR="${pkgdir}/usr/bin" install
}

# vim:set ts=2 sw=2 et:
