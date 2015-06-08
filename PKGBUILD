# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT CoM>
# Contributor: Xyne <ca dot archlinux at xyne, backwards>
pkgname=qd
pkgver=2.3.15
pkgrel=4
pkgdesc='C++/Fortran-90 double-double and quad-double library'
arch=('i686' 'x86_64')
url="http://crd-legacy.lbl.gov/~dhbailey/mpdist/"
license=('BSD')
depends=('bash')
makedepends=('gcc-fortran')
source=("http://crd.lbl.gov/~dhbailey/mpdist/${pkgname}-${pkgver}.tar.gz"
        "dd.h"
        "qd.h")
sha256sums=('17d7ed554613e4c17ac18670ef49d114ba706a63d735d72032b63a8833771ff7'
            '82997a10c28ed92847674a03e0ed75ac9eda83f898bd72fa8e11f63ccb731b38'
            'cdcb95056b230a46091d75d93703784b81e2b589dc3243fa3211d953e3978f4b')
options=(staticlibs)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"


  ./configure --prefix=/usr \
    --enable-static --enable-shared \
    --with-pic \
    --enable-fortran FC=gfortran

  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"

  install -Dm644 "${srcdir}/qd.h" "${pkgdir}/usr/include/qd/qd.h"
  install -Dm644 "${srcdir}/dd.h" "${pkgdir}/usr/include/qd/dd.h"
}

