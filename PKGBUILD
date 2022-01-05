# Maintainer: Max Harmathy <max.harmathy@web.de>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='ptouch-print'
pkgver=1.4.3
pkgrel=2
pkgdesc="Command line tool to print labels on Brother P-Touch printers"
arch=('x86_64')
url='https://familie-radermacher.ch/dominic/projekte/ptouch-print/'
license=('GPL3')
depends=('gd' 'libusb')
makedepends=('git')
provides=("${pkgname}")
source=("git+https://familie-radermacher.ch/cgi/cgit/linux/${pkgname}.git#commit=32c0d3be29f9eebb5d0e48f4f998da83b0c2ff3c")
# NB: updpkgsums --> SKIP
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
  make DESTDIR="${pkgdir}" -C "${pkgname}" install
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" "${pkgname}/${pkgname}.1"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}/README"
}

# vim: ts=2 sw=2 et:
