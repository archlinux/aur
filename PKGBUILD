# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='Iconoscope'
pkgname="${_pkgname,,}"
pkgver=0.9.7
pkgrel=1
pkgdesc='Explore the icon database in your system'
arch=('x86_64')
url='https://github.com/santileortiz/Iconoscope'
license=('GPL3')
depends=('gtk3')
makedepends=('python')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e4093003edc72545f33f379645e57437add4de3291814f813c230d3540a4818f')

prepare() {
  # Add LDFLAGS
  sed -i.bak "s/-lm/& ${LDFLAGS}/" "${_pkgname}-${pkgver}/pymk.py"
}

build() {
  cd "${_pkgname}-${pkgver}"
  ./pymk.py iconoscope
}

package() {
  cd "${_pkgname}-${pkgver}"
  ./pymk.py install --destdir "${pkgdir}/"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
}

# vim: ts=2 sw=2 et:
