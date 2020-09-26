# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Dominic Radermacher <blip@mockmoon-cybernetics.ch>

_pkgname='ptouch-print'
pkgname="${_pkgname}-git"
pkgver=1.4.3.r0.g32c0d3b
pkgrel=1
pkgdesc="Command line tool to print labels on Brother P-Touch printers"
arch=('x86_64')
url='https://mockmoon-cybernetics.ch/computer/p-touch2430pc/'
license=('GPL3')
depends=('gd' 'libusb')
makedepends=('git')
provides=("${_pkgname}")
source=("git+https://mockmoon-cybernetics.ch/cgi/cgit/linux/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
  make DESTDIR="${pkgdir}" -C "${_pkgname}" install
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" "${_pkgname}/${_pkgname}.1"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_pkgname}/README"
}

# vim: ts=2 sw=2 et:
