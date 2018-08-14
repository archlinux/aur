# Maintainer: TOCK Chiu <tock.chiu at gmail.com>

pkgname=skypat
_pkgname=SkyPat
pkgver=3.1.1
pkgrel=2
pkgdesc='A C++ unit and performance testing framework'
arch=('i686' 'x86_64')
url='https://skypat.skymizer.com/'
license=('custom:BSD')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/skymizer/SkyPat/archive/v${pkgver}.tar.gz")
sha256sums=('882342ada942057f6296162d137015e2ce0595d3fb3198a506b5b51bfa6e7420')
options=('staticlibs')

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
  ln -sf '/usr/share/skypat/LICENSE'   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -sf '/usr/share/skypat/README.md' "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  find "${pkgdir}/usr/share/skypat/examples/" -name 'Makefile' | while read FILE; do
    sed -e 's/\.\.\/\.\.\/\.\.\/\.\./\/usr/g' -i "$FILE"
  done
}

# vim:set ts=2 sw=2 et:
