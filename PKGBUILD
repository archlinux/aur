# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Ralf Mueller <stark.dreamdetective@gmail.com>
pkgname=szip
pkgver=2.1
pkgrel=4
pkgdesc="High compression library"
url="http://www.hdfgroup.org/doc_resource/SZIP"
license=('custom')
arch=('i686' 'x86_64')
source=("http://www.hdfgroup.org/ftp/lib-external/szip/${pkgver}/src/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a816d95d5662e8279625abdbea7d0e62157d7d1f028020b1075500bf483ed5ef')
makedepends=('gcc-fortran')
depends=('glibc')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Out of source build
  rm -rf build
  mkdir -p build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  ../configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
