# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

# NOTE: In order to build this package, you need the firmware for the camera
#       See the archwiki for more information on how to obtain it.

pkgname="bcwc_pcie-firmware"
pkgver=r189.6a12079
pkgrel=1
pkgdesc="Firmware for the reverse engineered Linux driver for the Broadcom 1570 PCIe webcam"
url="https://github.com/patjak/bcwc_pcie"
depends=()
optdepends=()
makedepends=('git')
arch=('any')
license=('custom')

_extramodules="extramodules-4.3-ARCH"

source=("http://support.apple.com/downloads/DL1831/en_US/AppleBcUpdate.exe"
        "extraction-tool::git+https://gist.github.com/ea82507d46f0d77fb922.git")
noextract=("AppleBcInstaller.exe")

sha256sums=('d4016f0f7c79440ddee2f3b9a2ab2d152875da88437ced9adb1512af50e03dd2'
            'SKIP')

prepare()
{
  chmod +x "${srcdir}/extraction-tool/extract-firmware.sh"
}

build()
{
  msg2 "Extracting firmware"
  cd "${srcdir}/extraction-tool"
  ./extract-firmware.sh "${srcdir}/AppleCameraInterface"
}

package()
{
  cd "${srcdir}/extraction-tool"
  install -dm755 "$pkgdir/usr/lib/firmware/facetimehd/"
  install -m644 'firmware.bin' "$pkgdir/usr/lib/firmware/facetimehd"
}
