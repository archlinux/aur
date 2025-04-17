# Maintainer: Harrison <contact@htv04.com>
# Contributor: Vladislav Ivanishin <vladislav.ivanishin@gmail.com>
# Contributor: Aetf <aetf@unlimitedcodeworks.xyz>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Christoph Gysin <christoph.gysin@gmail.com>

_pkgname="facetimehd-dkms"
pkgname="$_pkgname"
pkgver=0.6.13
pkgrel=1
pkgdesc='Reverse engineered Linux driver for the FacetimeHD (Broadcom 1570) PCIe webcam'
url='https://github.com/patjak/facetimehd'
license=('GPL-2.0-only')
arch=('any')

makedepends=('git')
optdepends=('facetimehd-data: Sensor calibration data')

provides=('bcwc-pcie' 'bcwc-pcie-dkms')
conflicts=('bcwc-pcie' 'bcwc-pcie-dkms')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+https://github.com/patjak/facetimehd.git#tag=$pkgver")
sha256sums=('SKIP')

package() {
  depends=(
    'facetimehd-firmware'
    'dkms'
  )

  cd "$_pkgsrc"
  for FILE in dkms.conf Makefile *.[ch]; do
    install -Dm644 "$FILE" "$pkgdir/usr/src/facetimehd-$pkgver/$FILE"
  done
}
