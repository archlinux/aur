# Maintainer: katoitalia
# Contributor: yw662
# Contributor: FabioLolix
# Contributor: aorth for his check-firmware-version.sh

pkgname=intel-ucode-clear
pkgver=33600
pkgrel=1
pkgdesc="Intel cpu microcode and i915 firmware used by Clear Linux"
arch=(x86_64)
url="https://clearlinux.org/"
license=()
provides=(intel-ucode)
_ucode=dafc994b611551d56ec40fafe77f552770d5e1c72b870e323191a95c8abf2700
_i915=17f0707b6321d2cc43db42468197677177e3c2c07712b026d28716595128a5cd
source=("${pkgver}-Manifest.linux-firmware::https://cdn.download.clearlinux.org/update/${pkgver}/Manifest.linux-firmware"
        "${pkgver}-00-intel-ucode.cpio.tar::https://cdn.download.clearlinux.org/update/${pkgver}/files/${_ucode}.tar"
        "${pkgver}-i915-firmware.cpio.xz.tar::https://cdn.download.clearlinux.org/update/${pkgver}/files/${_i915}.tar")
sha256sums=('cc64eee07250a31d7b07b80345838242c384516bafc52b6415ed5f286d9e6caf'
            '3258b131aecf607a901f56d550da3fb3c063ee530fbd7cfc7b6f79e4991a2f9a'
            '6bda1869f067d19c8a97093821b76e085ed8bd76b255fdf24c8dc9de4aa437b9')

build() {
  mv "${_ucode}" intel-ucode.cpio
  mv "${_i915}" i915-firmware.cpio.xz
}
package() {
  install -d "${pkgdir}"/boot
  install -D {intel-ucode.cpio,i915-firmware.cpio.xz} "${pkgdir}"/boot
}
