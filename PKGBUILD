# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='ptouch-print'
pkgver=1.4.3
pkgrel=1
pkgdesc="Command line tool to print labels on Brother P-Touch printers"
arch=('x86_64')
url='https://mockmoon-cybernetics.ch/computer/p-touch2430pc/'
license=('GPL3')
depends=('gd' 'libusb')
makedepends=('git')
provides=("${pkgname}")
source=("git+https://mockmoon-cybernetics.ch/cgi/cgit/linux/${pkgname}.git#tag=v${pkgver}")
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
