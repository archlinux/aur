# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Ralf Mueller <stark.dreamdetective@gmail.com>
pkgname=szip
pkgver=2.1.1
pkgrel=1
pkgdesc="High compression library"
url="http://www.hdfgroup.org/doc_resource/SZIP"
license=('custom')
arch=('i686' 'x86_64')
source=("http://www.hdfgroup.org/ftp/lib-external/szip/${pkgver}/src/${pkgname}-${pkgver}.tar.gz")
sha256sums=('897dda94e1d4bf88c91adeaad88c07b468b18eaf2d6125c47acac57e540904a9')
makedepends=('gcc-fortran')
depends=('glibc')

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
