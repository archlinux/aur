# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Ralf Mueller <stark.dreamdetective@gmail.com>
pkgname=szip
pkgver=2.1.1
pkgrel=3
pkgdesc="High compression library"
url="http://www.hdfgroup.org/doc_resource/SZIP"
license=('custom')
arch=('i686' 'x86_64')
source=("http://www.hdfgroup.org/ftp/lib-external/szip/${pkgver}/src/${pkgname}-${pkgver}.tar.gz")
sha256sums=('21ee958b4f2d4be2c9cabfa5e1a94877043609ce86fde5f286f105f7ff84d412')
makedepends=('gcc-fortran')
depends=('glibc')
conflicts=('libaec')

prepare() {
  cd "${srcdir}"

  # Out of source build
  rm -rf build
  mkdir -p build
}

build() {
  cd "${srcdir}/build"
  ../${pkgname}-${pkgver}/configure \
    --prefix=/usr
  make
}

check() {
  cd "${srcdir}/build"

  make check
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
