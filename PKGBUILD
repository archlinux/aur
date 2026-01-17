# Maintainer: AnmiTaliDev <anmitali198@gmail.com>

pkgname=mt7902-firmware-git
pkgver=r204.7e6d6e3
pkgrel=1
pkgdesc="Firmware files for MediaTek MT7902 WiFi 6E and Bluetooth chipset"
arch=('any')
url="https://github.com/AnmiTaliDev/mt7902-firmware-git"
license=('custom')
depends=()
makedepends=('git')
provides=('mt7902-firmware')
conflicts=('mt7902-firmware')
source=("git+https://github.com/OnlineLearningTutorials/mt7902_temp.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/mt7902_temp"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/mt7902_temp/mt7902_firmware"

  # Create target directory
  install -dm755 "${pkgdir}/usr/lib/firmware/mediatek"

  # Install WiFi firmware files
  install -Dm644 WIFI_MT7902_patch_mcu_1_1_hdr.bin.zst \
    "${pkgdir}/usr/lib/firmware/mediatek/WIFI_MT7902_patch_mcu_1_1_hdr.bin.zst"
  install -Dm644 WIFI_RAM_CODE_MT7902_1.bin.zst \
    "${pkgdir}/usr/lib/firmware/mediatek/WIFI_RAM_CODE_MT7902_1.bin.zst"

  # Install Bluetooth firmware file
  install -Dm644 BT_RAM_CODE_MT7902_1_1_hdr.bin.zst \
    "${pkgdir}/usr/lib/firmware/mediatek/BT_RAM_CODE_MT7902_1_1_hdr.bin.zst"

  # Install additional firmware files
  install -Dm644 mt7902_eeprom.bin.zst \
    "${pkgdir}/usr/lib/firmware/mediatek/mt7902_eeprom.bin.zst"
  install -Dm644 mt7902_rom_patch.bin.zst \
    "${pkgdir}/usr/lib/firmware/mediatek/mt7902_rom_patch.bin.zst"
  install -Dm644 mt7902_wa.bin.zst \
    "${pkgdir}/usr/lib/firmware/mediatek/mt7902_wa.bin.zst"
  install -Dm644 mt7902_wf_rom.bin.zst \
    "${pkgdir}/usr/lib/firmware/mediatek/mt7902_wf_rom.bin.zst"
  install -Dm644 mt7902_wf_rom_sram.bin.zst \
    "${pkgdir}/usr/lib/firmware/mediatek/mt7902_wf_rom_sram.bin.zst"
  install -Dm644 mt7902_wm.bin.zst \
    "${pkgdir}/usr/lib/firmware/mediatek/mt7902_wm.bin.zst"

  # Install LICENSE
  install -Dm644 "${srcdir}/mt7902_temp/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
