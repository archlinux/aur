# Maintainer: lambdadroid <lambdadroid@gmail.com>
pkgname=intel-ucode-byt-t-c0
pkgver=837
pkgrel=2
pkgdesc="CPU microcode update for Intel Valleyview, Bay Trail T (C0 step)"
arch=(x86_64)
license=('unknown')
options=('!strip')
_microcode=cpu30678_plat02_ver00000837_2018-01-25_PRD_F0D56486.bin
source=("https://raw.githubusercontent.com/platomav/CPUMicrocodes/079248c4d1d82695555539ef7ad6886c8c4fce3e/Intel/$_microcode")
sha256sums=('2a5d97c9c50b51f0de3139c127ad3f56a977ee6ee536c9d5854f33c2226485fa')

build() {
    mkdir -p kernel/x86/microcode
    cp "$_microcode" kernel/x86/microcode/GenuineIntel.bin
    echo kernel/x86/microcode/GenuineIntel.bin | bsdcpio -o -H newc -R 0:0 -O intel-ucode.img
}

package() {
    install -Dm644 intel-ucode.img "$pkgdir/boot/$pkgname.img"
}
