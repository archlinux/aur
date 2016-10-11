# Maintainer: TOCK Chiu <tock.chiu at gmail.com>

pkgname=skypat
_pkgname=SkyPat
pkgver=2.8
pkgrel=1
pkgdesc='A C++ unit and performance testing framework'
arch=('i686' 'x86_64')
url='https://skypat.skymizer.com/'
license=('custom:BSD')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/skymizer/SkyPat/archive/v${pkgver}.tar.gz")
md5sums=('0dbdc711eb247e53d5215b6659860de4')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}/"
  ln -sf '/usr/share/pat/LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -sf '/usr/share/pat/README'  "${pkgdir}/usr/share/doc/${pkgname}/README"

  find "${pkgdir}/usr/share/pat/examples/" -name 'Makefile' | while read FILE; do
    sed -e 's/\.\.\/\.\.\/\.\.\/\.\./\/usr/g' -i "$FILE"
  done
}

# vim:set ts=2 sw=2 et:
