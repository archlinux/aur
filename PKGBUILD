# Maintainer: Max Harmathy <max.harmathy@web.de>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=ptouch-print
pkgver=1.6
pkgrel=2
pkgdesc="Command line tool to print labels on Brother P-Touch printers"
arch=(x86_64)
url=https://familie-radermacher.ch/dominic/projekte/ptouch-print/
license=(GPL-3.0-only)
depends=(
  gd
  libusb
)
makedepends=(
  git
  cmake
)
provides=("${pkgname}")
source=("git+https://familie-radermacher.ch/cgi/cgit/linux/${pkgname}.git#tag=v${pkgver}")
sha256sums=('7cf287102ec002653e68a1ea73a78b000b9120389b209a30b6c2fa294087a132')

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
  install -Dm644 "${pkgname}/udev/90-usb-ptouch-permissions.rules" "${pkgdir}/usr/lib/udev/rules.d/72-usb-ptouch-permissions.rules"
}

# vim: ts=2 sw=2 et:
