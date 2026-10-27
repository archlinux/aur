# Bootloader for the raspberry pi SBCs (fw between the GPU ROM-kernel).
# Split package by board lineup to avoid clutter.
# NOT installed to /boot. Intended to be picked up by kernel-install.

pkgbase=raspberrypi-bootloader
pkgname=(raspberrypi-bootloader-rpi4)
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
