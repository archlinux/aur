# Maintainer: katoitalia
# Contributor: yw662
# Contributor: FabioLolix
# Contributor: aorth for his check-firmware-version.sh

pkgname=intel-ucode-clear
pkgver=33250
pkgrel=1
pkgdesc="Intel cpu microcode and i915 firmware used by Clear Linux"
arch=(x86_64)
url=""
license=()
#provides=(intel-ucode)
_ucode=f1d12a1788b7c0d81b32375cb4c7d9d13dd8b8edccb381ee3e8addd6fb84f876
_i915=4dc9995ee42c3d78e54a7b9e193e04c504ba8fff12c9106852dfaedf5083fc3f
source=("${pkgver}-Manifest.linux-firmware::https://cdn.download.clearlinux.org/update/${pkgver}/Manifest.linux-firmware"
        "${pkgver}-00-intel-ucode.cpio.tar::https://cdn.download.clearlinux.org/update/${pkgver}/files/${_ucode}.tar"
        "${pkgver}-i915-firmware.cpio.xz.tar::https://cdn.download.clearlinux.org/update/${pkgver}/files/${_i915}.tar")
sha256sums=('c88cae5cd183cd72f7200cd2516871d932cd10c520389796fc25dd4558a0a899'
            'b3caf7ad3dc5995ba96081f5926c6789b70f16c27074080d89ea9589b0eb8d0b'
            '1a55ff0562ccb3d2b56fc3bf09ea433ad05adc92b21b2c41923ec1b2b4441752')

build() {
  mv "${_ucode}" intel-ucode.cpio
  mv "${_i915}" i915-firmware.cpio.xz
}
package() {
  install -d "${pkgdir}"/boot
  install -D {intel-ucode.cpio,i915-firmware.cpio.xz} "${pkgdir}"/boot
}
