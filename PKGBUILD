# Maintainer: Yuri Nogueira <personal@yurinogueira.dev.br>

pkgname=rtl8761bu-firmware
pkgver=1.9.1038.3023
pkgrel=1
pkgdesc="Updated Realtek RTL8761BU Bluetooth 5.4 firmware (0xddd5c761) fixing Xbox Series X|S controller disconnects"
arch=('any')
url="https://github.com/yurinogueira/rtl8761bu-firmware"
license=('LicenseRef-rtlwifi')
depends=('linux-firmware-realtek')
makedepends=('zstd')
install="${pkgname}.install"
source=(
    "${url}/raw/main/rtl8761bu_fw.bin"
    "${url}/raw/main/rtl8761bu_config.bin"
    "${url}/raw/main/LICENSE"
)
sha256sums=(
    'f48cf7124028206bb049740cd4cb0c63c5ad6315febec19f5cf248138b663a47'
    '6c28a3f07c6a30ed208c4b64862a23f02b7d93543ea980edd24df16bab45095f'
    'a61351665b4f264f6c631364f85b907d8f8f41f8b369533ef4021765f9f3b62e'
)

build() {
    zstd -q -f -k "${srcdir}/rtl8761bu_fw.bin"
    zstd -q -f -k "${srcdir}/rtl8761bu_config.bin"
}

package() {
    install -Dm644 "${srcdir}/rtl8761bu_fw.bin" "${pkgdir}/usr/lib/firmware/updates/rtl_bt/rtl8761bu_fw.bin"
    install -Dm644 "${srcdir}/rtl8761bu_fw.bin.zst" "${pkgdir}/usr/lib/firmware/updates/rtl_bt/rtl8761bu_fw.bin.zst"
    install -Dm644 "${srcdir}/rtl8761bu_config.bin" "${pkgdir}/usr/lib/firmware/updates/rtl_bt/rtl8761bu_config.bin"
    install -Dm644 "${srcdir}/rtl8761bu_config.bin.zst" "${pkgdir}/usr/lib/firmware/updates/rtl_bt/rtl8761bu_config.bin.zst"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
