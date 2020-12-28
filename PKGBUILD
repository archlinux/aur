# Maintainer: katoitalia
# Contributor: yw662
# Contributor: FabioLolix
# Contributor: aorth for his check-firmware-version.sh

pkgname=intel-ucode-clear
pkgver=34110
pkgrel=1
pkgdesc="Intel cpu microcode and i915 firmware used by Clear Linux"
arch=(x86_64)
url="https://clearlinux.org/"
license=()
provides=(intel-ucode)
_ucode=5207519db506de57538f09408307bb08790b05d9ab72577703f7af203a639de0
_i915=15913a57de36619335d3423aed38c97ab0c24c303d9ba788432a30653e1dbbe6
source=("${pkgver}-Manifest.linux-firmware::https://cdn.download.clearlinux.org/update/${pkgver}/Manifest.linux-firmware"
        "${pkgver}-00-intel-ucode.cpio.tar::https://cdn.download.clearlinux.org/update/${pkgver}/files/${_ucode}.tar"
        "${pkgver}-i915-firmware.cpio.xz.tar::https://cdn.download.clearlinux.org/update/${pkgver}/files/${_i915}.tar")
sha256sums=('c8fa4cc4b2c65989256531fa110861694314bdfa3c1203657610436cbdd08867'
            '27a230c25da6d1e3ba9ceb457454f91bcb83306d356f5d073c61faec037cb3d1'
            '9121b20727ec651a263058f2d9212a9e388510c713c170cf3773826373306f45')

build() {
  mv "${_ucode}" intel-ucode.cpio
  mv "${_i915}" i915-firmware.cpio.xz
}
package() {
  install -d "${pkgdir}"/boot
  install -D {intel-ucode.cpio,i915-firmware.cpio.xz} "${pkgdir}"/boot
}
