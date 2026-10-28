# Maintainer: Max Harmathy <max.harmathy@web.de>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=ptouch-print
pkgver=1.9
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
source=("git+https://git.familie-radermacher.ch/linux/${pkgname}.git#tag=v${pkgver}")
sha256sums=('6c4ea1e583a391e6b4b7bf480f452774543839a5e0d09a5d47a61664ccda23be')

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
