# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT CoM>
# Contributor: Xyne <ca dot archlinux at xyne, backwards>
pkgname=qd
pkgver=2.3.17
pkgrel=1
pkgdesc='C++/Fortran-90 double-double and quad-double library'
arch=('i686' 'x86_64')
url="http://crd-legacy.lbl.gov/~dhbailey/mpdist"
license=('BSD')
depends=('bash')
makedepends=('gcc-fortran')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c58e276f6fcf5f2f442c525f3de42ea00004734572b29c74028bbda0ad81096d')
options=(staticlibs)

prepare(){
  cd "${srcdir}"

  rm -rf build
  mkdir -p build
}

build() {
  cd "${srcdir}/build"

  export FC=gfortran
  ../${pkgname}-${pkgver}/configure --prefix=/usr \
    --enable-static --enable-shared \
    --with-pic \
    --enable-fortran

  make
}

check() {
  cd "${srcdir}/build"

  make check
}

package() {
  cd "${srcdir}/build"

  make install DESTDIR="${pkgdir}"

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING"\
    "${pkgdir}/usr/share/licences/${pkgname}/COPYING"
}

