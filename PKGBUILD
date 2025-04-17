# Maintainer: Harrison <contact@htv04.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname="facetimehd-firmware"
pkgname="$_pkgname"
pkgver=1.0.0
pkgrel=2
epoch=1
pkgdesc='Firmware for the FacetimeHD (Broadcom 1570) PCIe webcam'
url='https://github.com/patjak/facetimehd-firmware'
license=('LicenseRef-Unknown')
arch=('any')

makedepends=('git' 'curl' 'xz' 'cpio')

conflicts=('bcwc-pcie-firmware')
provides=('bcwc-pcie-firmware')

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+https://github.com/patjak/facetimehd-firmware.git#tag=v$pkgver"
  "https://updates.cdn-apple.com/2019/cert/041-88431-20191011-e7ee7d98-2878-4cd9-bc0a-d98b3a1e24b1/OSXUpd10.11.5.dmg"
)
sha256sums=(
  'cc2cc6a935e46f50e94e25db2e903c21bb70633f4010153f4b71c07ddab9665b'
  '46cd31ee35b084f59dc8b8f632e6bebdb4badeafbab064eea32ae66cc3743301'
)

prepare() {
  cd "$_pkgsrc"
  sed -E 's&curl.*?URl.*?\|&cat "$(DMG)" |&' -i Makefile
}

build() {
  cd "$_pkgsrc"
  make
}

package() {
  install -Dm644 "$_pkgsrc/firmware.bin" "$pkgdir/usr/lib/firmware/facetimehd/firmware.bin"
}
