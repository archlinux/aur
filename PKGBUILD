# Maintainer: katoitalia
# Contributor: yw662
# Contributor: FabioLolix
# Contributor: aorth for his check-firmware-version.sh

pkgname=intel-ucode-clear
pkgver=34290
pkgrel=1
pkgdesc="Intel cpu microcode and i915 firmware used by Clear Linux"
arch=(x86_64)
url="https://clearlinux.org/"
license=()
provides=(intel-ucode)
_ucode=96391cf5f23299b89ac547f3bbdb81fbf06dc2af84242f63817e55a7aea3f42a
_i915=123835484741737919af1bbf2f43aea348d192007b6dbb54aa6c6c14b39fddc4
source=("${pkgver}-Manifest.linux-firmware::https://cdn.download.clearlinux.org/update/${pkgver}/Manifest.linux-firmware"
        "${pkgver}-00-intel-ucode.cpio.tar::https://cdn.download.clearlinux.org/update/${pkgver}/files/${_ucode}.tar"
        "${pkgver}-i915-firmware.cpio.xz.tar::https://cdn.download.clearlinux.org/update/${pkgver}/files/${_i915}.tar")
sha256sums=('27caa5d6eb3a0d3b6131a848c0251fb5454ee782d50ca34573c066acce0dc1b9'
            '637a66d0a329b51ae38bb77323078883a4125d2e782b424d29fb1c8854ef1f3b'
            '57b15ffd04554babc3f85f5c30b0a7fa770612d1d429562d921ea00346a3121d')

build() {
  mv "${_ucode}" intel-ucode.cpio
  mv "${_i915}" i915-firmware.cpio.xz
}
package() {
  install -d "${pkgdir}"/boot
  install -D {intel-ucode.cpio,i915-firmware.cpio.xz} "${pkgdir}"/boot
}
