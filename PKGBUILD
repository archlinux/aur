# Maintainer: raku-cat <raku at raku dot party>
# Based on intel-ucode by Thomas Bächler <thomas@archlinux.org>
pkgname=amd-ucode-early
pkgver=20180507
pkgrel=1
pkgdesc="Microcode update files for AMD CPUs"
arch=('any')
url="http://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git;a=summary"
license=('custom')
depends=('linux-firmware')
build() {
  cd "$srcdir"
  mkdir -p kernel/x86/microcode
  cat /lib/firmware/amd-ucode/microcode_amd*.bin > kernel/x86/microcode/AuthenticAMD.bin
  echo kernel/x86/microcode/AuthenticAMD.bin | bsdcpio -o -H newc -R 0:0 > amd-ucode.img
}
package() {
  cd "$srcdir"
  install -D -m0644 amd-ucode.img "${pkgdir}"/boot/amd-ucode.img
}