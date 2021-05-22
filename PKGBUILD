# Maintainer: katoitalia
# Contributor: yw662
# Contributor: FabioLolix
# Contributor: aorth for his check-firmware-version.sh

pkgname=intel-ucode-clear
pkgver=34380
pkgrel=1
pkgdesc="Intel cpu microcode and i915 firmware used by Clear Linux"
arch=(x86_64)
url="https://clearlinux.org/"
license=()
provides=(intel-ucode)
_ucode=973f1b665837a5d9bdf4daf7def4ffbaf3e89a96fea9bbb6be6a864730243deb
_i915=3bdcf116862f61ce1bfbe1c7cfac17516b80533d34a5b28b751378d031f89a03
source=("${pkgver}-Manifest.linux-firmware::https://cdn.download.clearlinux.org/update/${pkgver}/Manifest.linux-firmware"
        "${pkgver}-00-intel-ucode.cpio.tar::https://cdn.download.clearlinux.org/update/${pkgver}/files/${_ucode}.tar"
        "${pkgver}-i915-firmware.cpio.xz.tar::https://cdn.download.clearlinux.org/update/${pkgver}/files/${_i915}.tar")
sha256sums=('65e7509640432d585cbd9038f2b882f1b0b9eedee56c26180e400633334c280e'
            '5943d82fa1d152d920afd3712273bf1c7efbe5e9380020d467d3c4d741510af9'
            '08899af0d6676c47c3fbc67aa7722486498e1df97805792d3cbb1f9ba445252c')

build() {
  mv "${_ucode}" intel-ucode.cpio
  mv "${_i915}" i915-firmware.cpio.xz
}
package() {
  install -d "${pkgdir}"/boot
  install -D {intel-ucode.cpio,i915-firmware.cpio.xz} "${pkgdir}"/boot
}
