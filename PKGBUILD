# Maintainer: Max Harmathy <max.harmathy@web.de>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=ptouch-print
pkgver=1.7
pkgrel=1
pkgdesc="Command line tool to print labels on Brother P-Touch printers"
arch=(x86_64)
url=https://familie-radermacher.ch/dominic/projekte/ptouch-print/
license=(GPL-3.0-only)
depends=(
  gd
  glibc
  libusb
)
makedepends=(
  git
  cmake
)
provides=("${pkgname}")
source=("git+https://familie-radermacher.ch/cgi/cgit/linux/${pkgname}.git#tag=v${pkgver}")
sha256sums=('43b35a52f0b327742353d843ee25c4f119e6ac94a0c7a216734ab49f0ceb45c0')

build() {
  cd "${pkgname}"
  mkdir -p build
  cmake -B build -D CMAKE_BUILD_TYPE=Release
  make -C build
}

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}/build/ptouch-print"
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" "${pkgname}/${pkgname}.1"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}/README"
  install -Dm644 -t "${pkgdir}/usr/lib/udev/rules.d" "${pkgname}/udev/20-usb-ptouch-permissions.rules"
}

# vim: ts=2 sw=2 et:
