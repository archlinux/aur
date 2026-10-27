# Bootloader for the raspberry pi SBCs (fw between the GPU ROM-kernel).
# Split package by board lineup to avoid clutter. NOT automatically installed.
# For the Pi5 see https://github.com/raspberrypi/rpi-eeprom

pkgbase=raspberrypi-bootloader
pkgname=(raspberrypi-bootloader-legacy raspberrypi-bootloader-rpi4)
pkgver=1.20260915
pkgrel=1
pkgdesc="Bootloader files for Raspberry Pi"
arch=(any)
url="https://github.com/raspberrypi/firmware"
license=(custom)
conflicts=(raspberrypi-bootloader)
options=(!strip)
source=("https://github.com/raspberrypi/firmware/archive/refs/tags/$pkgver.tar.gz")
sha256sums=(58751354e5c8289d3660511958e8c7869de010f6719d8e1859820391058a337c)

package_raspberrypi-bootloader-rpi4() {
    pkgdesc+=" (4 only)"
    cd "$srcdir/firmware-$pkgver"

    install -Dm644 boot/LICENCE.broadcom "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    for file in start4{,cd,db,x}.elf fixup4{,cd,db,x}.dat; do
        install -Dm644 -t "$pkgdir/usr/lib/raspberrypi/rpi4/boot" "boot/$file"
    done
}

package_raspberrypi-bootloader-legacy() {
    pkgdesc+=" (1/2/3, Zero & Zero 2)"
    cd "$srcdir/firmware-$pkgver"

    install -Dm644 boot/LICENCE.broadcom "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    for file in start{,_cd,_x,_db}.elf fixup{,_cd,_x,_db}.dat bootcode.bin; do
        install -Dm644 -t "$pkgdir/usr/lib/raspberrypi/legacy/boot" "boot/$file"
    done
}
